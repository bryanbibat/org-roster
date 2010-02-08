require 'spec_helper'

describe Batch do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :order => 1,
      :year => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Batch.create!(@valid_attributes)
  end
end
