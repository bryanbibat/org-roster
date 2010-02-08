require 'spec_helper'

describe "/system_parameters/new.html.erb" do
  include SystemParametersHelper

  before(:each) do
    assigns[:system_parameter] = stub_model(SystemParameter,
      :new_record? => true,
      :code => "value for code",
      :value => "value for value"
    )
  end

  it "renders new system_parameter form" do
    render

    response.should have_tag("form[action=?][method=post]", system_parameters_path) do
      with_tag("input#system_parameter_code[name=?]", "system_parameter[code]")
      with_tag("input#system_parameter_value[name=?]", "system_parameter[value]")
    end
  end
end
