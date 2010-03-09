require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/committees/show.html.erb" do
  include CommitteesHelper
  before(:each) do
    assigns[:committee] = @committee = stub_model(Committee,
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 2000,
      :year_removed => 2004,
      :description => "value for description"
    )
    @current_user.stub!(:admin?).and_return true
    #TODO test role display
    assigns[:roles] = []
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ full_name/)
    response.should have_text(/2000/)
    response.should have_text(/2004/)
    response.should have_text(/value\ for\ description/)
  end
end
