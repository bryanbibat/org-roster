require 'spec_helper'

describe Committee do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 2000,
      :year_removed => 2004,
      :description => "value for description"
    }
    SystemParameter.stub(:find_by_code).with("year_founded").and_return(
      mock_model(SystemParameter, :value => 2000 ))
  end

  it "should create a new instance given valid attributes" do
    Committee.create!(@valid_attributes)
  end

  it "should create default members" do
    committee = Committee.create!(@valid_attributes)
    committee.roles.size.should == 2
  end
end
