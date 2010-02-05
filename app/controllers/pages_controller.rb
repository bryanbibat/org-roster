class PagesController < ApplicationController
  def main
    if User.all.empty?
      redirect_to new_account_path
    end
  end
end
