class RolesController < ApplicationController

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @committee = Committee.find(params[:committee_id])
    @role = @committee.roles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
    @committee = @role.committee
  end

  # POST /roles
  # POST /roles.xml
  def create
    @committee = Committee.find(params[:committee_id])
    @role = @committee.roles.build(params[:role])

    respond_to do |format|
      if @role.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to(@committee) }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])
    @committee = @role.committee

    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Role was successfully updated.'
        format.html { redirect_to(@committee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @committee = @role.committee

    @role.destroy

    respond_to do |format|
      format.html { redirect_to(@committee) }
      format.xml  { head :ok }
    end
  end
end
