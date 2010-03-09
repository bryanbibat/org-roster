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

    @user = stub_model(User, :email => "test")
    assigns[:user] = @user
    assigns[:committees] = [stub_model(Committee,
      :new_record? => true,
      :code => "value for code",
      :full_name => "value for full_name",
      :year_added => 1,
      :year_removed => 1,
      :description => "value for description"
    )]
    assigns[:roles] = []
    assigns[:year_founded] = 2000
    assigns[:current_academic_year] = 2010

  end

  it "renders the edit position form" do
    render

    response.should have_tag("form[action=#{user_position_path(@user, @position)}][method=post]") do
      with_tag("select#position_committee_id[name=?]", "position[committee_id]")
      with_tag("select#position_role_id[name=?]", "position[role_id]")
      with_tag("select#position_year[name=?]", "position[year]")
    end
  end
end
