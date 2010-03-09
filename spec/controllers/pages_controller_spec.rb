require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController, "GET main" do
  it "going to home page on fresh install should redirect to new account" do
    User.stub!(:all).and_return []
    get :main
    response.should redirect_to(new_account_path)
  end

  it "going to home page when there are users should redirect to login" do
    User.stub!(:all).and_return [mock_model(User)]
    get :main
    response.should redirect_to(login_path)
  end

end
