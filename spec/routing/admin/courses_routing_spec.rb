require "spec_helper"

describe Admin::CoursesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/app/courses" }.should route_to(:controller => "admin/courses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/app/courses/new" }.should route_to(:controller => "admin/courses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/app/courses/1" }.should route_to(:controller => "admin/courses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/app/courses/1/edit" }.should route_to(:controller => "admin/courses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/app/courses" }.should route_to(:controller => "admin/courses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/app/courses/1" }.should route_to(:controller => "admin/courses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/app/courses/1" }.should route_to(:controller => "admin/courses", :action => "destroy", :id => "1")
    end

  end
end
