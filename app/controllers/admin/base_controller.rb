class Admin::BaseController < ApplicationController

  before_action :authorize!

  private
    def authorize!
      render file: '/public/404' unless current_admin?
    end
end
