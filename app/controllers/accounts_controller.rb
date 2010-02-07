class AccountsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  before_filter :admin_missing, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "New account created. You can now login with the new account's credentials."
      redirect_to login_url
    else 
      render :action => 'new'
    end
  end

  private 
    
    def admin_missing
      if User.admin_exists?
        flash[:notice] = "New accounts can only be created by Admin users."
        redirect_to root_url
        return false
      end
    end

end
