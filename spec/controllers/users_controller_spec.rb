require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController, "check logged in" do

  context "not logged in" do
    before(:each) do 
      controller.stub!(:current_user).and_return nil 
    end

    it "should not allow viewing of index page" do
      get :index
      response.should be_redirect
    end
  end

  context "logged in" do
    before(:each) do
      @user = Factory(:user)
      controller.stub!(:current_user).and_return @user
    end

    it "should allow viewing of index page" do
      get :index
      response.should_not be_redirect
    end
  end
  
end

describe UsersController, "check admin" do

  context "admin" do
    before(:each) do 
      @user = Factory(:user, :role => "A")
      controller.stub!(:current_user).and_return @user
    end

    it "should be able to create new user" do
      get :new
      response.should_not be_redirect
    end
  end

  context "normal user" do
    before(:each) do
      @user = mock_model(User, :admin? => false)
      controller.stub!(:current_user).and_return @user
    end

    it "should not be able to create new user" do
      get :new
      response.should be_redirect
      flash[:notice].should == "You must be an admin to view this page."
    end
  end
  
end

describe UsersController, "GET index" do
  before(:each) do
    @user = mock_model(User, :save => nil, :admin? => false)
    controller.stub!(:current_user).and_return @user
  end

  it "should retrieve records from db" do
    users = [mock_model(User), mock_model(User)]
    User.should_receive(:find).and_return(users)
    get :index
    response.should be_success
  end

end

describe UsersController, "POST create" do
  #TODO integrate_view

  before(:each) do 
    @user = mock_model(User, :save => nil, :admin? => true)
    User.stub!(:new).and_return @user
    controller.stub!(:current_user).and_return @user
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
    @user = mock_model(User, :update_attributes => nil, :admin? => true)
    User.stub!(:find).and_return @user
    controller.stub!(:current_user).and_return @user
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
