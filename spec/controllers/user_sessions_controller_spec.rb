require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController, "POST login" do
  #TODO integrate_views

  before(:each) do
    @user_session = mock_model(UserSession, :save => nil)
    UserSession.stub!(:new).and_return @user_session
    controller.stub!(:current_user_session).and_return nil
  end
  
  it "login action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "login action should render new template when login is invalid" do
    @user_session.stub!(:save).and_return false
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when login is valid" do
    @user_session.stub!(:save).and_return true
    post :create
    response.should redirect_to(root_url)
  end

  it "destroy action should destroy model and redirect to index action" do
    controller.stub!(:current_user_session).and_return @user_session 
    controller.stub!(:current_user).and_return @user_session 
    @user_session.stub!(:destroy).and_return true
    delete :destroy
    response.should redirect_to(root_url)
  end

  #TODO test redirect to last page in case of expire
end
