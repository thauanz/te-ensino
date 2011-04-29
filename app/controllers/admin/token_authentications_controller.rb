class Admin::TokenAuthenticationsController < Admin::AdminController 

  def create
    @user = current_user
    @user.reset_authentication_token!
    redirect_to edit_user_registration_path
  end

  def destroy
    @user = current_user
    @user.authentication_token = nil
    @user.save
    redirect_to edit_user_registration_path(@user)
  end

end
