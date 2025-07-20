class AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to main_app.projects_path, alert: "Access Denied" unless Current.user.admin?
  end
end
