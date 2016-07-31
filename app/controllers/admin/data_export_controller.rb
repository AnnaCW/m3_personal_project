require 'csv'

class Admin::DataExportController < Admin::BaseController

  def index
    @listening_sessions = ListeningSession.all
    respond_to do |format|
      format.html
      format.csv { send_data @listening_sessions.to_csv, filename: "listening-sessions-#{Date.today}.csv"}
    end
  end

end
