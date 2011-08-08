# (en)coding: utf-8.
class Admin::RegistrationsController < Devise::SessionsController
  respond_to :html, :json, :xml
  
  layout Proc.new{ |controller| current_user.present? ? "admin" : "access" }
  
  menu_item :dashboard
  
  before_filter :authenticate_user!, :only => [:edit, :update]
  
  skip_before_filter :is_devise_resource?, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = User::ROLES[2]
    flash[:notice] = I18n.tm("created", "user") if @user.save
    respond_with @user, :location => new_user_session_url
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    flash[:notice] = I18n.tm("updated", "user") if @user.update_attributes(params[:user])
    respond_with @user, :location => admin_root_url
  end
end
