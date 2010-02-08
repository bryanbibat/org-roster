class PositionsController < ApplicationController

  # GET /positions/new
  # GET /positions/new.xml
  def new
    @user = User.find(params[:user_id])
    @position = @user.positions.build
    @committees = Committee.all(:order => :code)
    @roles = @committees.size > 0 ? @committees[0].roles : []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
    @user = @position.user
    @committees = Committee.all(:order => :code)
    @roles = @position.committee.roles
  end

  # POST /positions
  # POST /positions.xml
  def create
    
    @user = User.find(params[:user_id])
    @position = @user.positions.build(params[:position])

    respond_to do |format|
      if @position.save
        flash[:notice] = 'Position was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @position, :status => :created, :location => @position }
      else
        @committees = Committee.all(:order => :code)
        @roles = []
        if !params[:position][:committee_id].blank?
          @roles = Role.all(:condition => ["committee_id = ?", params[:position][:committee_id]])
        end

        format.html { render :action => "new" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.xml
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        flash[:notice] = 'Position was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        @committees = Committee.all(:order => :code)
        @roles = []
        if !params[:position][:committee_id].blank?
          @roles = Role.all(:condition => ["committee_id = ?", params[:position][:committee_id]])
        end

        format.html { render :action => "edit" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.xml
  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to(@user) }
      format.xml  { head :ok }
    end
  end
end
