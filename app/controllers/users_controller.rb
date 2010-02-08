class UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :except => [:index, :show]

  def index
    @users = User.all(:order => "last_name, first_name")
  end

  def new
    @user = User.new
    @batches = Batch.all(:order => "applicant_batch")
  end

  def show
    redirect_to account_url() if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    @batches = Batch.all(:order => "applicant_batch")
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to user_url(@user)
    else
      @batches = Batch.all(:order => "applicant_batch")
      render :action => 'new'
    end
  end
  
  def edit
    redirect_to edit_account_url() if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    @batches = Batch.all(:order => "applicant_batch")
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to user_url(@user)
    else
      @batches = Batch.all(:order => "applicant_batch")
      render :action => 'edit'
    end
  end
end
