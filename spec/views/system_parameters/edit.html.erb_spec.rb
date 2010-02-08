require 'spec_helper'

describe "/system_parameters/edit.html.erb" do
  include SystemParametersHelper

  before(:each) do
    assigns[:system_parameter] = @system_parameter = stub_model(SystemParameter,
      :new_record? => false,
      :code => "value for code",
      :value => "value for value"
    )
  end

  it "renders the edit system_parameter form" do
    render

    response.should have_tag("form[action=#{system_parameter_path(@system_parameter)}][method=post]") do
      with_tag('input#system_parameter_code[name=?]', "system_parameter[code]")
      with_tag('input#system_parameter_value[name=?]', "system_parameter[value]")
    end
  end
end
