class Admin::MessagesController < Admin::AdminController

  load_and_authorize_resource
  menu_item :forums
  
  def index
    @messages = Message.where(:forum_id => params[:forum_id])
    @message = Message.new
  end

  def show
  end

  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @message.forum_id = params[:forum_id]
    @message.user_id = current_user.id
    flash[:notice] = I18n.tm("created", "message") if @message.save
    respond_with @message, :location => admin_forum_messages_url
  end

  def destroy
    @message.destroy
    respond_with @message, :location => admin_forum_messages_url
  end
end
