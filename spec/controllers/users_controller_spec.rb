require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsersController, "POST create" do
  #TODO integrate_view

  before(:each) do 
    @user = mock_model(User, :save => nil)
    User.stub!(:new).and_return @user
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @user.stub!(:valid?).and_return false
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    @user.stub!(:save).and_return true 
    post :create
    response.should redirect_to(root_url)
  end
end

describe UsersController, "POST update" do
  

  before(:each) do 
    @user = mock_model(User, :update_attributes => nil)
    User.stub!(:find).and_return @user
  end
  
  #TODO check if parameter is present
  it "edit action should render edit template" do
    get :edit
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    @user.stub!(:valid?).and_return false
    put :update
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    @user.stub!(:update_attributes).and_return true 
    put :update
    response.should redirect_to(root_url)
  end
end
