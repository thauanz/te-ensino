class Admin::AssetsController < Admin::AdminController
    
  load_and_authorize_resource
  
  menu_item :assets
  
  def index
    @assets = @assets.paginate(:page => params[:page], :per_page => 15)
  end

  def new
  end

  def edit
  end

  def create
    flash[:notice] = I18n.tm("created", "asset") if @asset.save
    respond_with @asset, :location => admin_assets_url
  end

  def update
    flash[:notice] = I18n.tm("updated", "asset") if @asset.update_attributes(params[:asset])
    respond_with @asset, :location => admin_assets_url
  end

  def destroy
    @asset.destroy
    flash[:notice] = I18n.tm("destroyed", "asset")
    respond_with @asset, :location => admin_assets_url
  end
end
