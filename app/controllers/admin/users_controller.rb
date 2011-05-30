# (en)coding: utf-8.
class Admin::UsersController < Admin::AdminController

  load_and_authorize_resource :except => [:show]
  
  menu_item :users
  
  def index
    @users = @users.where("last_sign_in_at >= ? AND last_sign_in_at <= ?", 
                          params[:data_inicio].to_datetime, "#{params[:data_fim]} 23:59:59".to_datetime) if (params[:data_inicio].present? && params[:data_fim].present?)
    @users = @users.where(" course_id = ?", params[:course_id]) if !params[:course_id].nil?
    @users = @users.where(" users.enabled = ?", params[:user_enabled]) if !params[:user_enabled].nil?
    @users = @users.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
  end
  
  def create
    @user.password_invite(params[:user][:role]) if current_user.admin?

    if @user.save
      flash[:notice] = I18n.tm("created", "user")
      InvitationMailer.registration_teacher(@user).deliver
    end
    respond_with @user, :location => admin_users_url
  end
  
  def show
    @user = User.find(params[:id]) 
  end
    
  def update
    @user.enabled = !@user.enabled
    flash[:notice] = I18n.tm("updated", "user") if @user.update_attributes(params[:user])
    respond_with @user, :location => admin_users_url
  end

  def destroy
    @user.destroy
    flash[:notice] = I18n.tm("destroyed", "user")
    respond_with @user, :location => admin_users_url
  end
  
  def allusers
  
  end
 
end
