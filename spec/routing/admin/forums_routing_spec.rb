require "spec_helper"

describe Admin::ForumsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "app/forums" }.should route_to(:controller => "admin/forums", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "app/forums/new" }.should route_to(:controller => "admin/forums", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "app/forums/1" }.should route_to(:controller => "admin/forums", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "app/forums/1/edit" }.should route_to(:controller => "admin/forums", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "app/forums" }.should route_to(:controller => "admin/forums", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "app/forums/1" }.should route_to(:controller => "admin/forums", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "app/forums/1" }.should route_to(:controller => "admin/forums", :action => "destroy", :id => "1")
    end

  end
end
