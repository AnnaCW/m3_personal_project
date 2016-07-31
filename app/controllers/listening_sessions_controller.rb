 class ListeningSessionsController < ApplicationController

  def index
    @user = current_user if current_user
    @listening_sessions = ListeningSession.where(user_id: @user.id)
                                          .order(updated_at: :desc)
  end

 end
