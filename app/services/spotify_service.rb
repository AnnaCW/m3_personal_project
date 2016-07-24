class SpotifyService

  def initialize
    @_conn = Faraday.new("https://api.spotify.com/v1")
    # @_user = user
  end

  def get_categories(user)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
    response = conn.get("browse/categories")
    parse(response)
  end

  def get_category(user, category_id)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
    response = conn.get("browse/categories/#{category_id}")
    parse(response)
  end

  def get_playlists(user, category_id)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
    response = conn.get("browse/categories/#{category_id}/playlists")
    parse(response)
  end



  private

  def conn
    @_conn
  end

  def user
    @_user
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
