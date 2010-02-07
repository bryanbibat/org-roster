require File.dirname(__FILE__) + '/../spec_helper'

describe User, "validation" do
  before(:each) do 
    @user = Factory(:user)
  end

  it "should be valid" do
    @user.should be_valid
  end

  it "should not be valid if email is missing" do
    @user.email = nil
    @user.should_not be_valid
  end

  #missing password already handled by Authlogic

end

describe User, "creation" do

  it "should be admin on create if there are no users in the database" do
    User.delete_all
    @user = Factory(:user)
    User.all.count.should == 1
    @user.reload
    @user.should be_admin
  end

end
