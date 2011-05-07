# (en)coding: utf-8.
class Admin::UsersController < Admin::AdminController

  load_and_authorize_resource :except => :show
  
  menu_item :users
  
  def index
    @users = @users.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
  end
  
  def create
    @user.teacher_invite if current_user.admin?
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
end
