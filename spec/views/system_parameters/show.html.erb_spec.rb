require 'spec_helper'

describe "/system_parameters/show.html.erb" do
  include SystemParametersHelper
  before(:each) do
    assigns[:system_parameter] = @system_parameter = stub_model(SystemParameter,
      :code => "value for code",
      :value => "value for value"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ value/)
  end
end
