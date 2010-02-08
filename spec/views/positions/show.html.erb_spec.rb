require 'spec_helper'

describe "/positions/show.html.erb" do
  include PositionsHelper
  before(:each) do
    assigns[:position] = @position = stub_model(Position,
      :user => 1,
      :committee => 1,
      :role => 1,
      :year => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
