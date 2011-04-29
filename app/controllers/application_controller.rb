class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :xml, :json, :js
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to admin_root_url
  end

private

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      admin_root_url
    else
      super
    end
  end
end
