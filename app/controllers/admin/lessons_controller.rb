class Admin::LessonsController < Admin::AdminController
  
  before_filter :load_resources
  
  load_and_authorize_resource
  
  menu_item :lessons

  def index
    @lessons = @lessons.paginate(:page => params[:page], :per_page => 15)
  end

  def show    
  end
  
  def new
  end
  
  def create
    @lesson.course_id = params[:course_id]
    flash[:notice] = I18n.tm("created", "lesson") if @lesson.save
    respond_with @lesson, :location => admin_course_url(@lesson.course_id)
  end
  
  def edit
  end
  
  def update
    flash[:notice] = I18n.tm("updated", "lesson") if @lesson.update_attributes(params[:lesson])
    respond_with @lesson, :location => admin_course_url(@lesson.course_id)
  end
  
  def destroy
    @lesson.destroy
    flash[:notice] = I18n.tm("destroyed", "lesson")
    respond_with @lesson, :location => admin_course_url(params[:course_id])
  end
  
  def copy
    @lesson = Lesson.find(params[:id]).clone
    @courses = current_user.courses
    @lesson.save
    respond_with @lesson, :location => admin_course_url(@lesson.course_id)
  end
  
private
  def load_resources
    @assets = current_user.assets
  end
  
end
