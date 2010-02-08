require 'spec_helper'

describe "/positions/edit.html.erb" do
  include PositionsHelper

  before(:each) do
    assigns[:position] = @position = stub_model(Position,
      :new_record? => false,
      :user => 1,
      :committee => 1,
      :role => 1,
      :year => 1
    )
  end

  it "renders the edit position form" do
    render

    response.should have_tag("form[action=#{position_path(@position)}][method=post]") do
      with_tag('input#position_user[name=?]', "position[user]")
      with_tag('input#position_committee[name=?]', "position[committee]")
      with_tag('input#position_role[name=?]', "position[role]")
      with_tag('input#position_year[name=?]', "position[year]")
    end
  end
end
