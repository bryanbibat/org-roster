require File.dirname(__FILE__) + '/../spec_helper'


describe AccountsController, "GET new" do
  integrate_views
  before(:each) do 
    controller.stub!(:current_user).and_return nil
  end

  it "should open new account page" do
    User.stub!(:admin_exists?).and_return false
    get :new
    response.should render_template(:new)
  end

  it "should not open new account page if admin exists" do
    User.stub!(:admin_exists?).and_return true
    get :new
    response.should redirect_to(root_url)
    flash[:notice].should == "New accounts can only be created by Admin users." 
  end

  # We do not check if the user is logged out as you can only access this page
  # when there are no users in the database 
end

describe AccountsController, "POST create" do
  integrate_views

  before(:each) do 
    @user = Factory(:user)
    User.stub!(:new).and_return @user
    controller.stub!(:current_user_session).and_return nil
    User.stub!(:admin_exists?).and_return false 
  end
   
  it "should not create new account if admin exists page" do
    User.stub!(:admin_exists?).and_return true
    post :create
    response.should redirect_to(root_url)
    flash[:notice].should == "New accounts can only be created by Admin users." 
  end

  it "should redirect to login page when an account is successfully created" do
    @user.stub!(:save).and_return true
    post :create
    response.should redirect_to(root_url)
    flash[:notice].should == "New account created and automatically logged in."
  end

  it "should not redirect if there is an error in the entered values" do
    @user.stub!(:save).and_return false
    post :create
    response.should render_template(:new)
  end

end
