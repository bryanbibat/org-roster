require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "committees/index.html.erb" do
  before(:each) do
    @current_user.stub!(:admin?).and_return true
    assigns[:committees] = [
      stub_model(Committee,
        :code => "value for code",
        :full_name => "value for full_name",
        :year_added => 2000,
        :year_removed => 2004,
        :description => "value for description"
      ),
      stub_model(Committee,
        :code => "value for code",
        :full_name => "value for full_name",
        :year_added => 2000,
        :year_removed => 2004,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of committees" do
    render "committees/index.html.erb"
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for full_name".to_s, 2)
    response.should have_tag("tr>td", "2000 - 2004", 2)
  end
end
