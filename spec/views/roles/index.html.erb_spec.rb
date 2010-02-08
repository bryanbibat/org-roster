require 'spec_helper'

describe "/roles/index.html.erb" do
  include RolesHelper

  before(:each) do
    assigns[:roles] = [
      stub_model(Role,
        :name => "value for name",
        :committee => 1,
        :description => "value for description",
        :unique => false
      ),
      stub_model(Role,
        :name => "value for name",
        :committee => 1,
        :description => "value for description",
        :unique => false
      )
    ]
  end

  it "renders a list of roles" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
