class SystemParametersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  # GET /system_parameters
  # GET /system_parameters.xml
  def index
    @system_parameters = SystemParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_parameters }
    end
  end

  # GET /system_parameters/1
  # GET /system_parameters/1.xml
  def show
    @system_parameter = SystemParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_parameter }
    end
  end

  # GET /system_parameters/new
  # GET /system_parameters/new.xml
  def new
    @system_parameter = SystemParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_parameter }
    end
  end

  # GET /system_parameters/1/edit
  def edit
    @system_parameter = SystemParameter.find(params[:id])
  end

  # POST /system_parameters
  # POST /system_parameters.xml
  def create
    @system_parameter = SystemParameter.new(params[:system_parameter])

    respond_to do |format|
      if @system_parameter.save
        flash[:notice] = 'SystemParameter was successfully created.'
        format.html { redirect_to(@system_parameter) }
        format.xml  { render :xml => @system_parameter, :status => :created, :location => @system_parameter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system_parameters/1
  # PUT /system_parameters/1.xml
  def update
    @system_parameter = SystemParameter.find(params[:id])

    respond_to do |format|
      if @system_parameter.update_attributes(params[:system_parameter])
        flash[:notice] = 'SystemParameter was successfully updated.'
        format.html { redirect_to(@system_parameter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system_parameters/1
  # DELETE /system_parameters/1.xml
  def destroy
    @system_parameter = SystemParameter.find(params[:id])
    @system_parameter.destroy

    respond_to do |format|
      format.html { redirect_to(system_parameters_url) }
      format.xml  { head :ok }
    end
  end
end
