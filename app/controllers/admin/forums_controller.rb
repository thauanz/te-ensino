class Admin::ForumsController < Admin::AdminController

  load_and_authorize_resource :message
  load_and_authorize_resource :forum, :through => :message, :shallow => true
  
  menu_item :forums
  
  def index
  end

  def show
  end

  def new
    messages = @forum.messages.build
  end

  def edit
  end

  def create
    @forum.messages.each {|message| message.user_id = current_user.id }
    flash[:notice] = I18n.tm("created", "forum") if @forum.save
    respond_with @forum, :location => admin_forums_url
  end

  def update
    flash[:notice] = I18n.tm("updated", "forum") if @forum.update_attributes(params[:forum])
    respond_with @forum, :location => admin_forums_url
  end

  def destroy
    @forum.destroy
    respond_with @forum, :location => admin_forums_url
  end
end
