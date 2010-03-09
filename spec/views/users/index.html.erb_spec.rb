require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "users/index.html.erb" do

  before(:each) do
    @users = []
    @users << mock_model(User, :last_name => "Allen", :first_name => "Alice", 
                         :picture_url => "", :roster_display => "Alice Allen", 
                         :batch_display => " ", :status => "Member",
                         :admin? => false)
    @users << mock_model(User, :last_name => "Doe", :first_name => "John", 
                         :picture_url => "", :roster_display => "John Doe",
                         :batch_display => " ", :status => "Alumni",
                         :admin? => true)
    @batches = [Batch.new(:year => 2000, :applicant_batch => 0, :name => "Founding")]
    assigns[:users] = @users
    assigns[:batches] = @batches
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
      response.should contain("Alice Allen")
      response.should contain("John Doe")
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


