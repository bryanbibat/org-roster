require 'spec_helper'

describe "/batches/index.html.erb" do
  include BatchesHelper

  before(:each) do
    assigns[:batches] = [
      stub_model(Batch,
        :name => "value for name",
        :order => 1,
        :year => 1
      ),
      stub_model(Batch,
        :name => "value for name",
        :order => 1,
        :year => 1
      )
    ]
  end

  it "renders a list of batches" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
