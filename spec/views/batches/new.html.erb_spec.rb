require 'spec_helper'

describe "/batches/new.html.erb" do
  include BatchesHelper

  before(:each) do
    assigns[:batch] = stub_model(Batch,
      :new_record? => true,
      :name => "value for name",
      :order => 1,
      :year => 1
    )
  end

  it "renders new batch form" do
    render

    response.should have_tag("form[action=?][method=post]", batches_path) do
      with_tag("input#batch_name[name=?]", "batch[name]")
      with_tag("input#batch_order[name=?]", "batch[order]")
      with_tag("input#batch_year[name=?]", "batch[year]")
    end
  end
end
