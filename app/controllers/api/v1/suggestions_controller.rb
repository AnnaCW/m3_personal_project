class Api::V1::SuggestionsController < ApiBaseController

  def index

    user = User.find(params[:user_id])
    render json: Suggestion.get_from_seeds( user, {"seed_artists" => params["seed_artists"], "seed_tracks" => params["seed_tracks"], "seed_genres" => params["seed_genres"] } )
  end
end
