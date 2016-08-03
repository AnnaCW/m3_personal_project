class ArtistsController < ApplicationController

  def show
    user = current_user if current_user
    @artist = Artist.find(user, params[:id])
    @top_tracks = Artist.top_tracks(user, params[:id])
  end
end
