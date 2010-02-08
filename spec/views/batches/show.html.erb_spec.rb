require 'spec_helper'

describe "/batches/show.html.erb" do
  include BatchesHelper
  before(:each) do
    assigns[:batch] = @batch = stub_model(Batch,
      :name => "value for name",
      :order => 1,
      :year => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
