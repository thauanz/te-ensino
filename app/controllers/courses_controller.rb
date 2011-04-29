class CoursesController < ApplicationController
  
  menu_item :courses
  
  def index
    @courses = Course.scoped
    @courses = Course.where(:enabled => true)
    @courses = Course.search(params[:search]) if params[:search].present?
    @courses = @courses.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @course = Course.where(:enabled => true).find(params[:id])
  end

end
