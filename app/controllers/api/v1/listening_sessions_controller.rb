class Api::V1::ListeningSessionsController < ApiBaseController

  def create
    render json: ListeningSession.create(listening_session_params)
  end

  def update
    render json: ListeningSession.update(params[:id], listening_session_params)
    # render status: 204
  end

  private

   def listening_session_params
     params.require(:listening_session).permit(:user_id, :item_id, :item_name, :item_type, :playlist_owner_id, :notes, :duration, :agitation_before, :agitation_after, :awareness_before, :awareness_after, :communicativeness_before, :communicativeness_after)
   end

end
