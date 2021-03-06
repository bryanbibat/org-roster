class UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:new, :create, :delete]
  before_filter :require_admin_or_current => [:edit_credentials, :update_credentials]
  before_filter :remove_role_from_params

  def index
    @users = User.all(:conditions => process_query).sort_by { |user| user.roster_display.upcase }
    @batches = Batch.all(:order => "applicant_batch")
  end

  def new
    @user = User.new
    @batches = Batch.all(:order => "applicant_batch")
    @possible_buddies = []
 end

  def show
    @user = User.find(params[:id])
    @batches = Batch.all(:order => "applicant_batch")
    @positions = @user.positions.sort_by { |position| position.year }
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to user_url(@user)
    else
      @batches = Batch.all(:order => "applicant_batch")
      @possible_buddies = possible_buddies
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @batches = Batch.all(:order => "applicant_batch")
    @possible_buddies = possible_buddies
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to user_url(@user)
    else
      @batches = Batch.all(:order => "applicant_batch")
      @possible_buddies = possible_buddies
      render :action => 'edit'
    end
  end

  def edit_credentials
    @user = User.find(params[:id])
  end
  
  def update_credentials
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to user_url(@user)
    else
      render :action => 'edit_credentials'
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User was successfully deleted.'
    redirect_to users_path
  end

  private 
    def require_admin_or_current
      unless current_user and 
        (current_user.admin? || current_user == params[:id])
        flash[:notice] = "You must be an admin or the owner of the profile " +
          "to access this page."
        redirect_to users_url(params[:id])
        return false 
      end
    end

    def remove_role_from_params
      if !current_user.admin? && !params[:user].nil?
        params[:user].delete(:role)
      end
    end

    def possible_buddies
      [User.new(:nickname => '-- choose one below --')] + 
      User.possible_buddies(@user.batch_id).sort_by { |user| user.roster_display.upcase }

    end

    def statuses
      ["Member", "Alumni", "Inactive Alumni"]
    end

    def process_query
      conditions = []
      conditions << "status = ?" if params.has_key?(:status) && !statuses.index(params[:status]).nil? 
      conditions << "batch_id = ?" if params.has_key?(:batch_id) && params[:batch_id].to_i != 0
      conditions << "role <> 'A'" if params.has_key?(:admin) && params[:admin] != 'A'
      conditions << "role = 'A'" if params.has_key?(:admin) && params[:admin] == 'A'

      parameters = []
      parameters << params[:status] if params.has_key?(:status) && !statuses.index(params[:status]).nil?
      parameters << params[:batch_id].to_i if params.has_key?(:batch_id) && params[:batch_id].to_i != 0
      
      return [ conditions.join(" and ") ] + parameters if conditions.size > 0

      []
    end
end
