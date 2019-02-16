class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :signed_in_user

  def authorize_user
    @user = User.find(params[:id])
    redirect_to(admin_user_path(current_user)) unless current_user?(@user) || current_user.admin?
  end

  def require_admin
    redirect_to(admin_user_path(current_user)) unless current_user && current_user.admin?
  end

  def signed_in_user
    store_location
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end
