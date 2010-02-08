require 'spec_helper'

describe Role do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :committee_id => 1,
      :description => "value for description",
      :unique => false
    }
  end

  it "should create a new instance given valid attributes" do
    Role.create!(@valid_attributes)
  end
end
