require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "user_sessions/new.html.erb" do 
  before(:each) do
    @user_session = mock_model(UserSession, :null_object => true).as_new_record  
    assigns[:user_session] = @user_session 
  end
  
  it "should display a login form" do
    render "user_sessions/new.html.erb" 
    response.should have_selector("form[method=post]", :action => login_path) do |form|
      form.should have_selector("input[type=submit]")
    end
  end

  it "should render a text field for email" do
    @user_session.stub!(:email).and_return "test@email.co"
    render "user_sessions/new.html.erb"
    response.should have_selector("input[type=text]", 
                                  :name => "user_session[email]", 
                                  :value=> "test@email.co")
  end


  it "should render a text field for password" do
    @user_session.stub!(:password).and_return ""
    render "user_sessions/new.html.erb"
    response.should have_selector("input[type=password]",
                                  :name => "user_session[password]",
                                  :value => "")
  end

end
