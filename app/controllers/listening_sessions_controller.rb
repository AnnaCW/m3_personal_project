class ListeningSessionsController < ApplicationController

  def new
    @user = current_user if current_user
    @listen = Listen.new
  end
end
