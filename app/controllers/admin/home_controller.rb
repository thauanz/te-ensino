class Admin::HomeController < Admin::AdminController

  menu_item :home
  
  def index
    if current_user.admin?
      @matriculations = Matriculation.where(:enabled => false)
      @matriculations = @matriculations.where(:course_id => params[:course_id]) if !params[:course_id].nil?
      @courses = Course.where(:enabled => true)
      
    else
      if params[:date_at].nil?
        @courses = current_user.courses if current_user.teacher?
        
        @matriculations = current_user.matriculations if current_user.student?
        
        @alerts = Alert.joins(
                    :course => :matriculations).where(
                      "matriculations.user_id = ? AND alerts.created_at > ? AND matriculations.enabled = true",
                      current_user.id, Time.at(params[:after].to_i + 1)
                    ).paginate(:page => params[:page], :per_page => 5)  if can? :read, Alert
      end
      
      @lessons = current_user.teacher? ? 
                  current_user.lessons.where(:date_at => date_params).all : 
                  Lesson.joins(
                    :course => :matriculations).where( 
                      :enabled => true,
                      :matriculations => {:user_id => current_user.id, :enabled => true},
                      :date_at => date_params
                    ).all if can? :read, Lesson
    end
  end
   
private
  def date_params 
    (params[:date_at].nil? ? Date.today : params[:date_at].to_date)
  end
end
