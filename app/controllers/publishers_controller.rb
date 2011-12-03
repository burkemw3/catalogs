class PublishersController < ApplicationController
  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = current_user.publishers.search(params[:search])

    respond_to do |format|
      format.html
    end
  end

  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @publisher = current_user.publishers.find(params[:id], :include => [:catalogs, :calls])
    
    respond_to do |format|
      format.html
    end
  end

  # GET /publishers/new
  # GET /publishers/new.json
  def new
    @publisher = Publisher.new

    respond_to do |format|
      format.html
    end
  end

  # GET /publishers/1/edit
  def edit
    @publisher = current_user.publishers.find(params[:id])
  end

  # POST /publishers
  # POST /publishers.json
  def create
    @publisher = current_user.publishers.new(params[:publisher])

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, :notice => 'Publisher was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /publishers/1
  # PUT /publishers/1.json
  def update
    @publisher = current_user.publishers.find(params[:id])

    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])
        format.html { redirect_to @publisher, :notice => 'Publisher was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher = current_user.publishers.find(params[:id])
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url }
    end
  end
end
