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

  
private

  def user
    @_user
  end

end
