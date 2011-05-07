class AlertsController < Admin::AdminController
  def index
    @alerts = Alert.joins(
            :course => :matriculations).where(
              "matriculations.user_id = ? AND alerts.created_at > ? AND matriculations.enabled = true",
              current_user.id, Time.at(params[:after].to_i + 1)
            ).paginate(:page => params[:page], :per_page => 5)  if can? :read, Alert
  end
end
