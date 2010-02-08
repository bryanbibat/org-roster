require 'spec_helper'

describe "/system_parameters/index.html.erb" do
  include SystemParametersHelper

  before(:each) do
    assigns[:system_parameters] = [
      stub_model(SystemParameter,
        :code => "value for code",
        :value => "value for value"
      ),
      stub_model(SystemParameter,
        :code => "value for code",
        :value => "value for value"
      )
    ]
  end

  it "renders a list of system_parameters" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
  end
end
