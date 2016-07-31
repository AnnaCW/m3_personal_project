class SuggestionsController < ApplicationController

  def index
    user = current_user if current_user
    @presenter ||= SuggestionsPresenter.new(user, params)
   end
end
