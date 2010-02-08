require 'spec_helper'

describe "/positions/new.html.erb" do
  include PositionsHelper

  before(:each) do
    assigns[:position] = stub_model(Position,
      :new_record? => true,
      :user => 1,
      :committee => 1,
      :role => 1,
      :year => 1
    )
  end

  it "renders new position form" do
    render

    response.should have_tag("form[action=?][method=post]", positions_path) do
      with_tag("input#position_user[name=?]", "position[user]")
      with_tag("input#position_committee[name=?]", "position[committee]")
      with_tag("input#position_role[name=?]", "position[role]")
      with_tag("input#position_year[name=?]", "position[year]")
    end
  end
end
