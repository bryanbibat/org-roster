require 'spec_helper'

describe SystemParameter do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :value => "value for value"
    }
  end

  it "should create a new instance given valid attributes" do
    SystemParameter.create!(@valid_attributes)
  end
end
