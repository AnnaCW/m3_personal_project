class SpotifyService

  def initialize
    @_conn = Faraday.new("https://api.spotify.com/v1")
  end

  def get_categories(user)
    set_header(user)
    response = conn.get("browse/categories?offset=0&limit=40")
    parse(response)
  end

  def get_category(user, category_id)
    set_header(user)
    response = conn.get("browse/categories/#{category_id}")
    parse(response)
  end

  def get_category_playlists(user, category_id)
    set_header(user)
    response = conn.get("browse/categories/#{category_id}/playlists")
    parse(response)
  end

  # def get_playlist(user, playlist_id)
  #   set_header(user)
  #   response = conn.get("search?=id:#{param}")
  #   parse(response)
  # end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def set_header(user)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

end
