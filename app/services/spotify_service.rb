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
  #
  # def get_suggestions(seeds)
  #   response = conn.get("recommendations?seed_artists=#{}&seed_tracks=#{}&seed_genres#{}")
  #   parse(response)
  # end
  # # recommendations?seed_artists=4NHQUGzhtTLFvgF5SZesLK&seed_tracks=0c6xIDDpzE81m2q797ordA&min_energy=0.4&min_popularity=50&market=US"

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
