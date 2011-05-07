class Admin::MatriculationsController < Admin::AdminController

  before_filter :load_resources
  menu_item :matriculation
  
  load_and_authorize_resource 
  
  def index
    @matriculations = @matriculations.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @lessons = @matriculation.course.lessons.where(:enabled => true).paginate(:page => params[:page], :per_page => 15) if(current_user.student?)
  end

  def new
  end

  def edit
  end

  def create
    @matriculation.user = current_user
    flash[:notice] = I18n.tm("created", "matriculation") if @matriculation.save
    respond_with @matriculation, :location => admin_root_url
  end

  def update
    @matriculation.enabled = !@matriculation.enabled
    flash[:notice] = I18n.tm("updated", "matriculation") if @matriculation.update_attributes(params[:matriculation])
    respond_with @matriculation, :location => admin_root_url
  end

  def destroy
    @matriculation.destroy
    flash[:notice] = I18n.tm("destroyed", "matriculation")
    respond_with @matriculation, :location => admin_matriculations_url
  end

private
  def load_resources
    @courses = Course.activated
  end
end
