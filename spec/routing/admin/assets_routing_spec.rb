require "spec_helper"

describe Admin::AssetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/app/assets" }.should route_to(:controller => "admin/assets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/app/assets/new" }.should route_to(:controller => "admin/assets", :action => "new")
    end

    it "recognizes and generates #edit" do
      { :get => "/app/assets/1/edit" }.should route_to(:controller => "admin/assets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/app/assets" }.should route_to(:controller => "admin/assets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/app/assets/1" }.should route_to(:controller => "admin/assets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/app/assets/1" }.should route_to(:controller => "admin/assets", :action => "destroy", :id => "1")
    end

  end
end
