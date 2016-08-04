class Playlist

  def self.service(user)
    @@service ||= SpotifyUserService.new(user)
  end

  def self.all(user)
    response_object = Playlist.service(user).get_user_playlists
    response_object["items"].map do |raw_playlist|
      OpenStruct.new(raw_playlist)
    end
  end

  def self.update(user, playlist_id, track_uri)
    Playlist.service(user).add_track(playlist_id, track_uri)
  end

  def self.create(user, playlist_name)
    Playlist.service(user).create_playlist(playlist_name)
  end

end
