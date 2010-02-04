require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    Factory(:user).should be_valid
  end
end
