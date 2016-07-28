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

  def get_genre_seeds
    response = conn.get("recommendations/available-genre-seeds")
    parse(response)
  end

  def get_suggestions(seeds)
    response = conn.get("recommendations?seed_artists=#{seeds['seed_artists']}&seed_tracks=#{seeds['seed_tracks']}&seed_genres=#{seeds['seed_genres']}&min_popularity=50&limit=10&market=US")
    parse(response)
  end

  def get_decade_playlists(decade)
    response = conn.get("search?type=playlist&q=#{decade}&market=us&limit=10")
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
