require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "users/index.html.erb" do

  before(:each) do
    @users = []
    @users << User.new(:last_name => "Allen", :first_name => "Alice")
    @users << User.new(:last_name => "Doe", :first_name => "John")
    assigns[:users] = @users
  end

  context "admin" do
    before(:each) do
      @current_user.stub!(:admin?).and_return true
    end
 
    it "should display New User Link if admin" do
      render "users/index.html.erb"
      response.should have_selector("a[href='/users/new']") do |element|
        element.should contain("New User")
      end
    end
   
    it "should display a table of data" do
      render "users/index.html.erb"
      response.should contain("Allen, Alice")
      response.should contain("Doe, John")
    end
  end

  context "not admin" do 

    before(:each) do
      @current_user.stub!(:admin?).and_return false
    end
 
    it "should not display New User Link if not admin" do
      render "users/index.html.erb"
      response.should_not have_selector("a[href='/users/new']") do |element|
        element.should_not contain("New User")
      end
    end

 end
end


