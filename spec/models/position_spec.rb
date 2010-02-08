require 'spec_helper'

describe Position do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :committee_id => 1,
      :role_id => 1,
      :year => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Position.create!(@valid_attributes)
  end
end
