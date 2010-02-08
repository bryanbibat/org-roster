require 'spec_helper'

describe "/roles/new.html.erb" do
  include RolesHelper

  before(:each) do
    assigns[:role] = stub_model(Role,
      :new_record? => true,
      :name => "value for name",
      :committee => 1,
      :description => "value for description",
      :unique => false
    )
  end

  it "renders new role form" do
    render

    response.should have_tag("form[action=?][method=post]", roles_path) do
      with_tag("input#role_name[name=?]", "role[name]")
      with_tag("input#role_committee[name=?]", "role[committee]")
      with_tag("textarea#role_description[name=?]", "role[description]")
      with_tag("input#role_unique[name=?]", "role[unique]")
    end
  end
end
