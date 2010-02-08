require 'spec_helper'

describe Committee do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 1,
      :year_removed => 1,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Committee.create!(@valid_attributes)
  end
end
