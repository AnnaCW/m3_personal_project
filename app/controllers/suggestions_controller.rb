class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @genres = Suggestion.genres(user)
  end
end
