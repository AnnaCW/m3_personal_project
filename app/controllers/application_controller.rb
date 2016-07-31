require 'csv'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authorize!

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  def authorize!
    redirect_to(root_path, warning: "You Do Not Have Access") unless current_admin?
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
