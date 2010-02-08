require 'spec_helper'

describe "/committees/index.html.erb" do
  include CommitteesHelper

  before(:each) do
    assigns[:committees] = [
      stub_model(Committee,
        :code => "value for code",
        :full_name => "value for full_name",
        :year_added => 1,
        :year_removed => 1,
        :description => "value for description"
      ),
      stub_model(Committee,
        :code => "value for code",
        :full_name => "value for full_name",
        :year_added => 1,
        :year_removed => 1,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of committees" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for full_name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
