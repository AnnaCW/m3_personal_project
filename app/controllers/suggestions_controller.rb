class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @genres = Suggestion.genres(user)
    @decades = Suggestion.decades(user)

    if params[:commit] && params[:genre]
      if params[:genre] == ""
        @suggestions_from_genre == false
      else
        selected_genre = params[:genre]
        @genre = selected_genre.capitalize
        @suggestions_from_genre = Suggestion.get_from_seeds(user, {"seed_artists" => nil, "seed_tracks" => nil, "seed_genres" => selected_genre} )
      end

    elsif params[:commit] && params[:decade]
      if params[:decade] == ""
        @suggestions_from_decade == false
      else
        selected_genre = params[:decade]
        @decade = selected_genre.capitalize
        @suggestions_from_decade = Suggestion.get_from_seeds(user, {"seed_artists" => nil, "seed_tracks" => nil, "seed_genres" => selected_genre} )
      end
    end
  end


end
