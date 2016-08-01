require 'csv'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authorize!

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  def current_admin?
    current_user && current_user.admin?
  end

  def authorize!
    redirect_to(root_url, warning: "You Do Not Have Access") unless authorized?
  end

  def authorized?
    current_permission.allow?
  end

  def current_permission
    @current_permission ||= PermissionsService.new(current_user, params[:controller], params[:action])
  end

end
