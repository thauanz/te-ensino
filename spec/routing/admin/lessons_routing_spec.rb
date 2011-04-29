require "spec_helper"

describe Admin::LessonsController do
  describe "routing" do

    it "recognizes and generates #new" do
      { :get => "/app/courses/1/lessons/new" }.should route_to(:controller => "admin/lessons", :action => "new", :course_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/app/courses/1/lessons/1/edit" }.should route_to(:controller => "admin/lessons", :action => "edit", :id => "1", :course_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/app/courses/1/lessons" }.should route_to(:controller => "admin/lessons", :action => "create", :course_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/app/courses/1/lessons/1" }.should route_to(:controller => "admin/lessons", :action => "update", :id => "1", :course_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/app/courses/1/lessons/1" }.should route_to(:controller => "admin/lessons", :action => "destroy", :id => "1", :course_id => "1")
    end

  end
end
