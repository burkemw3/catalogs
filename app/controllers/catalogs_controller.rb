class CatalogsController < ApplicationController
  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = current_user.catalogs.all

    respond_to do |format|
      format.html
    end
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
    @catalog = current_user.catalogs.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /catalogs/new
  # GET /catalogs/new.json
  def new
    @catalog = Catalog.new

    if params[:publisher_id]
      @catalog.publisher_id = params[:publisher_id]
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /catalogs/1/edit
  def edit
    @catalog = current_user.catalogs.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(params[:catalog])
    
    publisher = current_user.publishers.find_by_id(@catalog.publisher_id)
    if publisher.nil?
      raise 'Publisher does not exist'
    end
    
    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog, :notice => 'Catalog was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /catalogs/1
  # PUT /catalogs/1.json
  def update
    @catalog = current_user.catalogs.find(params[:id])

    respond_to do |format|
      if @catalog.update_attributes(params[:catalog])
        format.html { redirect_to @catalog, :notice => 'Catalog was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog = current_user.catalogs.find(params[:id])
    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to catalogs_url }
    end
  end
end
