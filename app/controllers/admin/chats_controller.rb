class Admin::ChatsController < Admin::AdminController

  def show
    @chats = Chat.where(:course_id => params[:course_id]).last(20)
  end
  
  def create
    @chat = Chat.create!(:content => params[:chat][:content], :course_id => params[:course_id], :user => current_user)
  end
end
