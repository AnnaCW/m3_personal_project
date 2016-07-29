class Api::V1::ListeningSessionsController < ApiBaseController

  def create
    render json: ListeningSession.create(listening_session_params)
  end

  def update
    render json: ListeningSession.update(params[:id], listening_session_params)
  end

  private

   def listening_session_params
     params.require(:listening_session).permit(:notes, :rating)
   end

end
