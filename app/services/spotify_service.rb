class SpotifyService

  def initialize(user)
    @_conn = Faraday.new("https://api.spotify.com/v1")
    set_header(user)
  end

  def get_categories
    response = conn.get("browse/categories?offset=0&limit=40")
    parse(response)
  end

  def get_category(category_id)
    response = conn.get("browse/categories/#{category_id}")
    parse(response)
  end

  def get_category_playlists(category_id)
    response = conn.get("browse/categories/#{category_id}/playlists")
    parse(response)
  end

  private

  def conn
    @_conn
  end

  def set_header(user)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
