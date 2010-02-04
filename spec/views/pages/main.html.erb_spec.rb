require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "pages/main.html.erb" do 
  it "should display welcome message" do
    render "pages/main.html.erb" 
    response.should contain("Welcome to roster program.")
  end
end
