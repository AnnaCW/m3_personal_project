class PlaylistsController < ApplicationController

  def index
    user = current_user if current_user
    @playlists = Playlist.all(user)
  end
end
