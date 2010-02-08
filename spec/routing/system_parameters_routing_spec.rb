require 'spec_helper'

describe SystemParametersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/system_parameters" }.should route_to(:controller => "system_parameters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/system_parameters/new" }.should route_to(:controller => "system_parameters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/system_parameters/1" }.should route_to(:controller => "system_parameters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/system_parameters/1/edit" }.should route_to(:controller => "system_parameters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/system_parameters" }.should route_to(:controller => "system_parameters", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/system_parameters/1" }.should route_to(:controller => "system_parameters", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/system_parameters/1" }.should route_to(:controller => "system_parameters", :action => "destroy", :id => "1") 
    end
  end
end
