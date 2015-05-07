class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render :file_not_found unless current_admin?
  end
end
