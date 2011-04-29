class AlertsController < Admin::AdminController
  def index
    #current_user.matriculations.each do |matriculation|
    #  @alerts = matriculation.course.alerts.where("created_at > ?", Time.at(params[:after].to_i + 1)).paginate(:page => params[:page], :per_page => 5)
    #end
    @alerts = Alert.joins(:course => :matriculations).where("matriculations.user_id = ? AND alerts.created_at > ?", current_user.id, Time.at(params[:after].to_i + 1)).paginate(:page => params[:page], :per_page => 5)
  end
end
