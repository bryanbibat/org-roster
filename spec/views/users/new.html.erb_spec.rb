require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "users/new.html.erb" do 
  before(:each) do
    @user = mock_model(User, :null_object => true).as_new_record 
    assigns[:user] = @user 
    assigns[:batches] = [Batch.new(:year => 2000, :applicant_batch => 0, :name => "Founding")]
    assigns[:possible_buddies] = []
  end
  
  it "should display a create user form" do
    render "users/new.html.erb" 
    response.should have_selector("form[method=post]", :action => users_path) do |form|
      form.should have_selector("input[type=submit]")
    end
  end

  it "should render a text field for email" do
    @user.stub!(:email).and_return "test@email.co"
    render "users/new.html.erb"
    response.should have_selector("input[type=text]", 
                                  :name => "user[email]", 
                                  :value=> "test@email.co")
  end

  it "should render a text field for first name" do
    @user.stub!(:first_name).and_return "first"
    render "users/new.html.erb"
    response.should have_selector("input[type=text]", 
                                  :name => "user[first_name]", 
                                  :value=> "first")
  end

  it "should render a text field for last name" do
    @user.stub!(:last_name).and_return "last"
    render "users/new.html.erb"
    response.should have_selector("input[type=text]", 
                                  :name => "user[last_name]", 
                                  :value=> "last")
  end

  it "should render a text field for password" do
    @user.stub!(:password).and_return ""
    render "users/new.html.erb"
    response.should have_selector("input[type=password]",
                                  :name => "user[password]",
                                  :value => "")
  end

  it "should render a text field for password confirmation" do
    @user.stub!(:password_confirmation).and_return ""
    render "users/new.html.erb"
    response.should have_selector("input[type=password]",
                                  :name => "user[password_confirmation]",
                                  :value => "")
  end

end
