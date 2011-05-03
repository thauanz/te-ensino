# (en)coding: utf-8.
class Admin::UsersController < Admin::AdminController

  load_and_authorize_resource :except => :show
  
  menu_item :users
  
  def index
  end
  
  def new
  end
  
  def create
    @user.role = current_user.role_invite
    flash[:notice] = I18n.tm("created", "user") if @user.save
    if @user.errors.keys == [:password]
      @user.reset_authentication_token!
      InvitationMailer.registration_teacher(@user).deliver
    end
    @user.errors.delete(:password)
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
end
