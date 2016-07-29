class Api::V1::ListeningSessionsController < ApiBaseController

  def create
    render json: ListeningSession.create(listening_session_params)
  end

  def update
    render json: ListeningSession.update(params[:id], listening_session_params)
  end

  private

   def listening_session_params
     params.require(:listening_session).permit(:user_id, :item_id, :item_name, :item_type, :notes, :rating)
   end

end
