class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @presenter ||= SuggestionsPresenter.new(user, params)

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
        selected_decade = params[:decade]
        @decade = selected_decade
        @suggestions_from_decade = Suggestion.decade_playlists(user, selected_decade)
      end
    end
  end


end
