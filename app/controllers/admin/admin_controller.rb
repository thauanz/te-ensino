class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  respond_to :html, :js, :json
end
