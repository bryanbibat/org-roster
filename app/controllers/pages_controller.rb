class PagesController < ApplicationController
  before_filter :require_user, :only => [:readme]
  def main
    if User.all.empty?
      redirect_to new_account_path
    else
      redirect_to login_path unless current_user
    end
  end

  def readme
  end
end
