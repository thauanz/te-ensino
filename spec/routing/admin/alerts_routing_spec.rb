require "spec_helper"

describe Admin::AlertsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/app/alerts" }.should route_to(:controller => "admin/alerts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/app/alerts/new" }.should route_to(:controller => "admin/alerts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/app/alerts/1" }.should route_to(:controller => "admin/alerts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/app/alerts/1/edit" }.should route_to(:controller => "admin/alerts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/app/alerts" }.should route_to(:controller => "admin/alerts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/app/alerts/1" }.should route_to(:controller => "admin/alerts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/app/alerts/1" }.should route_to(:controller => "admin/alerts", :action => "destroy", :id => "1")
    end

  end
end
