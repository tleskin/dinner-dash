class AdminsController < ApplicationController
  before_action :require_admin

  def show

  end

  def require_admin
    render '/../../public/404' unless current_admin?
  end
end
