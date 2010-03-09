require 'spec_helper'

describe "/roles/new.html.erb" do
  include RolesHelper

  before(:each) do
    assigns[:role] = stub_model(Role,
      :new_record? => true,
      :name => "value for name",
      :committee => 1,
      :description => "value for description",
      :execom => false
    )
    @committee = stub_model(Committee,
      :new_record? => true,
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 1,
      :year_removed => 1,
      :description => "value for description"
    )

    assigns[:committee] = @committee 
  end

  it "renders new role form" do
    render

    response.should have_tag("form[action=?][method=post]", committee_roles_path(@committee)) do
      with_tag("input#role_name[name=?]", "role[name]")
      with_tag("textarea#role_description[name=?]", "role[description]")
      with_tag("input#role_execom[name=?]", "role[execom]")
    end
  end
end
