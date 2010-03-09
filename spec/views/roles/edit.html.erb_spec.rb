require 'spec_helper'

describe "/roles/edit.html.erb" do
  include RolesHelper

  before(:each) do
    assigns[:role] = @role = stub_model(Role,
      :new_record? => false,
      :name => "value for name",
      :committee => 1,
      :description => "value for description",
      :unique => false
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

  it "renders the edit role form" do
    render

    response.should have_tag("form[action=#{committee_role_path(@committee, @role)}][method=post]") do
      with_tag('input#role_name[name=?]', "role[name]")
      with_tag("textarea#role_description[name=?]", "role[description]")
      with_tag('input#role_execom[name=?]', "role[execom]")
    end
  end
end
