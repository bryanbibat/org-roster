require 'spec_helper'

describe "/positions/index.html.erb" do
  include PositionsHelper

  before(:each) do
    assigns[:positions] = [
      stub_model(Position,
        :user => 1,
        :committee => 1,
        :role => 1,
        :year => 1
      ),
      stub_model(Position,
        :user => 1,
        :committee => 1,
        :role => 1,
        :year => 1
      )
    ]
  end

  it "renders a list of positions" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
