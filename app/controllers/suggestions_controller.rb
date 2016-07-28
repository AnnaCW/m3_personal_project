class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @genres = Suggestion.genres(user)

    if params[:commit] && params[:genre]
      if params[:genre] == ""
        @suggestions_from_genre == false
      else
        selected_genre = params[:genre]
        @genre = selected_genre.capitalize
        @suggestions_from_genre = Suggestion.get_from_seeds(user, {"seed_artists" => nil, "seed_tracks" => nil, "seed_genres" => selected_genre} )
      end
    end
  end


end
