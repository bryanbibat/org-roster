require 'spec_helper'

describe RolesController do
  describe "routing" do

    it "recognizes and generates #new" do
      { :get => "/committees/1/roles/new" }.should route_to(:controller => "roles", :action => "new", :committee_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/committees/1/roles/1/edit" }.should route_to(:controller => "roles", :action => "edit", :id => "1" , :committee_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/committees/1/roles" }.should route_to(:controller => "roles", :action => "create", :committee_id => "1") 
    end

    it "recognizes and generates #update" do
      { :put => "/committees/1/roles/1" }.should route_to(:controller => "roles", :action => "update", :id => "1", :committee_id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/committees/1/roles/1" }.should route_to(:controller => "roles", :action => "destroy", :id => "1", :committee_id => "1") 
    end
  end
end
