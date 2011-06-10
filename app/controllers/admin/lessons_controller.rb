# (en)coding: utf-8.
class Admin::LessonsController < Admin::AdminController
  
  before_filter :load_resources
  
  load_and_authorize_resource
  
  menu_item :lessons

  def index
    @lessons = @lessons.order("course_id, date_at").paginate(:page => params[:page], :per_page => 15)
  end

  def show
    begin
      @audit = @lesson.audits.create!(:user_id => current_user.id) if current_user.student?
    rescue
    end
  end
  
  def new
  end
  
  def create
    @lesson.course_id = params[:course_id]
    flash[:notice] = I18n.tm("created", "lesson") if @lesson.save
    respond_with @lesson, :location => admin_course_url(@lesson.course_id)
  end
  
  def edit
    @courses = current_user.courses
  end
  
  def update
    flash[:notice] = I18n.tm("updated", "lesson") if @lesson.update_attributes(params[:lesson])
    @courses = current_user.courses
    respond_with @lesson, :location => admin_course_url(@lesson[:course_id])
    #redirect_to admin_courses_url
  end
  
  def destroy
    @lesson.destroy
    flash[:notice] = I18n.tm("destroyed", "lesson")
    respond_with @lesson, :location => admin_course_url(params[:course_id])
  end
  
  def copy
    @lesson = Lesson.find(params[:id]).clone
    @lesson.theme = "Copia de #{@lesson.theme}"
    @lesson.enabled = false
    flash[:notice] = "Aula copiada com sucesso." if @lesson.save
    redirect_to admin_lessons_url
  end
  
private
  def load_resources
    @assets = current_user.assets
  end
  
end
