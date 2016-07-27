class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @genres = Suggestion.genres(user)

    if params[:commit]
      selected_genre = params[:genre]
      @suggestions = Suggestion.get_from_seeds(user, {"seed_artists" => nil, "seed_tracks" => nil, "seed_genres" => selected_genre} )
    end
  end


end
