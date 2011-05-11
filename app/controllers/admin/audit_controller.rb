class Admin::AuditController < Admin::AdminController
  load_and_authorize_resource
  
  def index
    @resources = Audit.where(:audit_id => params[:lesson_id], :audit_type => "Lesson") if params[:lesson_id].present?
    @resources = Audit.where(:audit_id => params[:alert_id], :audit_type => "Alert") if params[:alert_id].present?
  end

end
