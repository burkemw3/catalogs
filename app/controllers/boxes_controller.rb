class BoxesController < ApplicationController
  # GET /boxes/1
  # GET /boxes/1.json
  def show
    @box = current_user.boxes.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /boxes/new
  # GET /boxes/new.json
  def new
    @box = Box.new

    if params[:catalog_id]
      @box.catalog_id = params[:catalog_id]
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /boxes/1/edit
  def edit
    @box = current_user.boxes.find(params[:id])
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(params[:box])

    catalog = current_user.catalogs.find(@box.catalog_id)
    if catalog.nil?
      raise 'Catalog does not exist'
    end

    respond_to do |format|
      if @box.save
        format.html { redirect_to catalog_path(@box.catalog), :notice => 'Box was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.json
  def update
    @box = current_user.boxes.find(params[:id])

    respond_to do |format|
      if @box.update_attributes(params[:box])
        format.html { redirect_to catalog_path(@box.catalog), :notice => 'Box was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box = current_user.boxes.find(params[:id])
    @catalog = @box.catalog
    @box.destroy

    respond_to do |format|
      format.html { redirect_to catalog_path(@catalog), :notice => 'Box destroyed' }
    end
  end
end
