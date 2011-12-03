class CallsController < ApplicationController
  # GET /calls
  # GET /calls.json
  def index
    @calls = current_user.calls.all

    respond_to do |format|
      format.html
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = current_user.calls.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /calls/new
  # GET /calls/new.json
  def new
    @call = Call.new

    if params[:publisher_id]
      @call.publisher_id = params[:publisher_id]
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /calls/1/edit
  def edit
    @call = current_user.calls.find(params[:id])
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(params[:call])
    
    publisher = current_user.publishers.find_by_id(@call.publisher_id)
    if publisher.nil?
      raise 'publisher does not exist'
    end
    
    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, :notice => 'Call was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.json
  def update
    @call = current_user.calls.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to @call, :notice => 'Call was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call = current_user.calls.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
    end
  end
end
