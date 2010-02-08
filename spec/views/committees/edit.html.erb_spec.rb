require 'spec_helper'

describe "/committees/edit.html.erb" do
  include CommitteesHelper

  before(:each) do
    assigns[:committee] = @committee = stub_model(Committee,
      :new_record? => false,
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 1,
      :year_removed => 1,
      :description => "value for description"
    )
  end

  it "renders the edit committee form" do
    render

    response.should have_tag("form[action=#{committee_path(@committee)}][method=post]") do
      with_tag('input#committee_code[name=?]', "committee[code]")
      with_tag('input#committee_full_name[name=?]', "committee[full_name]")
      with_tag('input#committee_year_added[name=?]', "committee[year_added]")
      with_tag('input#committee_year_removed[name=?]', "committee[year_removed]")
      with_tag('textarea#committee_description[name=?]', "committee[description]")
    end
  end
end
