class Admin::ListeningSessionsController < Admin::BaseController
  def index
    @listening_sessions = ListeningSession.all
  end
end
