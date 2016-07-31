class SuggestionsPresenter

  def initialize(user, params)
    @_user = user
    @_params = params
  end

  def genres
    @genres ||= Suggestion.genres(user)
  end

  def decades
    @decades ||= Suggestion.decades
  end

  def suggestions_from_genre
    if params[:commit] && params[:genre]
      if params[:genre] == ""
        @suggestions_from_genre == false
      else
        selected_genre = params[:genre]
        @suggestions_from_genre = Suggestion.get_from_seeds(user, {"seed_artists" => nil, "seed_tracks" => nil, "seed_genres" => selected_genre} )
      en
    end
  end

  def genre
    @genre = params[:genre].capitalize
  end


    def suggestions_from_decade
      if params[:commit] && params[:decade]
        if params[:decade] == ""
          @suggestions_from_decade == false
        else
          selected_decade = params[:decade]
          @suggestions_from_decade = Suggestion.decade_playlists(user, selected_decade)
        end
      end
   end

   def decade
     @decade = params[:decade]
   end


private

  def user
    @_user
  end

  def params
    @_params
  end

end
