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
      flash[:notice].should == "You must be an admin to access this page."
    end
  end
  
end

describe UsersController, "GET index" do
  before(:each) do
    @user = mock_model(User, :save => nil, :admin? => false, :roster_display => "")
    controller.stub!(:current_user).and_return @user
  end

  it "should retrieve records from db" do
    users = [@user, mock_model(User, :roster_display => "")]
    User.should_receive(:find).and_return(users)
    get :index
    response.should be_success
  end

end

describe UsersController, "POST create" do
  #TODO integrate_view

  before(:each) do 
    @user = mock_model(User, :save => nil, :id => 1, :admin? => true, :batch_id => 0)
    User.stub!(:new).and_return @user
    User.stub!(:possible_buddies).and_return []
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
    response.should redirect_to(user_url(@user))
  end
end

describe UsersController, "POST update" do
  

  before(:each) do 
    @user = mock_model(User, :update_attributes => nil, :batch_id => 0)
    User.stub!(:find).and_return @user
    User.stub!(:possible_buddies).and_return []
    controller.stub!(:current_user).and_return mock_model(User, :id => 1, :admin? => true)
  end
  
  #TODO check if parameter is present
  it "edit action should render edit template" do
    get :edit, :id => 2
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @user.stub!(:valid?).and_return false
    put :update, :id => 1
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    @user.stub!(:update_attributes).and_return true 
    put :update, :id => 1
    response.should redirect_to(user_url(@user))
  end
end
