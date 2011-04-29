require "spec_helper"

describe Admin::MatriculationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/app/matriculations" }.should route_to(:controller => "admin/matriculations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/app/matriculations/new" }.should route_to(:controller => "admin/matriculations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/app/matriculations/1" }.should route_to(:controller => "admin/matriculations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/app/matriculations/1/edit" }.should route_to(:controller => "admin/matriculations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/app/matriculations" }.should route_to(:controller => "admin/matriculations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/app/matriculations/1" }.should route_to(:controller => "admin/matriculations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/app/matriculations/1" }.should route_to(:controller => "admin/matriculations", :action => "destroy", :id => "1")
    end

  end
end
