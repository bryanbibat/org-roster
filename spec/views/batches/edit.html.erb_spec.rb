require 'spec_helper'

describe "/batches/edit.html.erb" do
  include BatchesHelper

  before(:each) do
    assigns[:batch] = @batch = stub_model(Batch,
      :new_record? => false,
      :name => "value for name",
      :order => 1,
      :year => 1
    )
  end

  it "renders the edit batch form" do
    render

    response.should have_tag("form[action=#{batch_path(@batch)}][method=post]") do
      with_tag('input#batch_name[name=?]', "batch[name]")
      with_tag('input#batch_order[name=?]', "batch[order]")
      with_tag('input#batch_year[name=?]', "batch[year]")
    end
  end
end
