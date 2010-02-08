require 'spec_helper'

describe CommitteesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/committees" }.should route_to(:controller => "committees", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/committees/new" }.should route_to(:controller => "committees", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/committees/1" }.should route_to(:controller => "committees", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/committees/1/edit" }.should route_to(:controller => "committees", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/committees" }.should route_to(:controller => "committees", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/committees/1" }.should route_to(:controller => "committees", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/committees/1" }.should route_to(:controller => "committees", :action => "destroy", :id => "1") 
    end
  end
end
