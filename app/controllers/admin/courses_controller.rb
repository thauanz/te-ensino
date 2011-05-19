class Admin::CoursesController < Admin::AdminController

  before_filter :load_resources
  
  load_and_authorize_resource
  
  menu_item :courses
  
  def index
    @courses = @courses.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @lessons = Lesson.joins(:course).where("course_id = ?", params[:id])
    @lessons = @lessons.where("courses.tutor_id = ?", current_user.id) if current_user.tutor?
    @lessons = @lessons.paginate(:page => params[:page], :per_page => 15) 
  end

  def new
  end

  def edit
  end

  def create
    flash[:notice] = I18n.tm("created", "course") if @course.save
    respond_with @course, :location => admin_courses_url
  end

  def update
    flash[:notice] = I18n.tm("updated", "course") if @course.update_attributes(params[:course])
    respond_with @course, :location => admin_courses_url
  end

  def destroy
    @course.destroy
    flash[:notice] = I18n.tm("destroyed", "course")
    respond_with @course, :location => admin_courses_url
  end
  
  def matriculations
    @matriculations = Matriculation.where("course_id = ? AND enabled = true", params[:id])
  end
  
private
  def load_resources
    @teachers = User.teacher
    @tutors = User.tutor
  end
end
