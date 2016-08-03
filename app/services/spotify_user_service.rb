class SpotifyUserService

  def initialize(user)
    @_user = user
    @_conn = Faraday.new("https://api.spotify.com/v1")
    set_header(user)
  end

  def create_playlist(name)
    response = conn.post do |req|
      req.url "users/#{user.uid}/playlists"
      req.body = "{\"name\":\"#{name}\", \"public\":true}"
    end
    parse(response)
  end

  def add_track(playlist_id, track_uri)
    response = conn.post("users/#{user.uid}/playlists/#{playlist_id}/tracks?uris=spotify:track:#{track_uri}")
    parse(response)
  end

  def get_user_playlists
    response = conn.get("users/#{user.uid}/playlists")
    parse(response)
  end

  def search_tracks(unformatted_search)
    formatted_search = unformatted_search.split.join("%20")
    response = conn.get("search?q=#{formatted_search}&type=track")
    parse(response)
  end

  private

  def conn
    @_conn
  end

  def user
    @_user
  end

  def set_header(user)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
    conn.headers["Content-Type"] = "application/json"
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
