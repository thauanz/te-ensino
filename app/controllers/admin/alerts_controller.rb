class Admin::AlertsController < Admin::AdminController
  
  before_filter :load_resources
  
  menu_item :alerts
  
  load_and_authorize_resource
  
  def index
    @alerts = @alerts.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    begin
      @audit = @alert.audits.create!(:user_id => current_user.id) if current_user.student?
    rescue
    end
  end

  def new
  end

  def edit
  end

  def create
    flash[:notice] = I18n.tm("created", "alert") if @alert.save
    respond_with @alert, :location => admin_alerts_url
  end

  def update
    flash[:notice] = I18n.tm("updated", "alert") if @alert.update_attributes(params[:alert])
    respond_with @alert, :location => admin_alerts_url
  end

  def destroy
    @alert.destroy
    flash[:notice] = I18n.tm("destroyed", "alert")
    respond_with @alert, :location => admin_alerts_url
  end

private
  def load_resources
    @courses = current_user.courses.activated
  end
end
