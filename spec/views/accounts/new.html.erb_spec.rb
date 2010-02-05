require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "accounts/new.html.erb" do 
  before(:each) do
    @user = mock_model(User, :null_object => true).as_new_record 
    assigns[:user] = @user 
  end
  
  it "should display a create account form" do
    render "accounts/new.html.erb" 
    response.should have_selector("form[method=post]", :action => account_path) do |form|
      form.should have_selector("input[type=submit]")
    end
  end

  it "should render a text field for email" do
    @user.stub!(:email).and_return "test@email.co"
    render "accounts/new.html.erb"
    response.should have_selector("input[type=text]", 
                                  :name => "user[email]", 
                                  :value=> "test@email.co")
  end


  it "should render a text field for password" do
    @user.stub!(:password).and_return ""
    render "accounts/new.html.erb"
    response.should have_selector("input[type=password]",
                                  :name => "user[password]",
                                  :value => "")
  end

  it "should render a text field for password confirmation" do
    @user.stub!(:password_confirmation).and_return ""
    render "accounts/new.html.erb"
    response.should have_selector("input[type=password]",
                                  :name => "user[password_confirmation]",
                                  :value => "")
  end

end
