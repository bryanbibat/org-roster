require 'spec_helper'

describe "/committees/show.html.erb" do
  include CommitteesHelper
  before(:each) do
    assigns[:committee] = @committee = stub_model(Committee,
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 1,
      :year_removed => 1,
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ full_name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ description/)
  end
end
