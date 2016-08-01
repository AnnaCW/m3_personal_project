class SpotifyService

  def initialize(user)
    @_conn = Faraday.new("https://api.spotify.com/v1")
    set_header(user)
    @_cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 5.minutes)
  end

  def get_categories
    response = cache.fetch("get-categories") do
      conn.get("browse/categories?offset=0&limit=40")
    end
    parse(response)
  end

  def get_category(category_id)
    response = cache.fetch("get-category-#{category_id}") do
      conn.get("browse/categories/#{category_id}")
    end
    parse(response)
  end

  def get_category_playlists(category_id)
    response = cache.fetch("get-category-playlists-#{category_id}") do
      conn.get("browse/categories/#{category_id}/playlists")
    end
    parse(response)
  end

  def get_genre_seeds
    response = cache.fetch("get-genre-seeds") do
      conn.get("recommendations/available-genre-seeds")
    end
    parse(response)
  end

  def get_suggestions(seeds)
    response = cache.fetch("get-suggestions-#{seeds}") do
      conn.get("recommendations?seed_artists=#{seeds['seed_artists']}&seed_tracks=#{seeds['seed_tracks']}&seed_genres=#{seeds['seed_genres']}&min_popularity=50&limit=10&market=US")
    end
    parse(response)
  end

  def get_decade_playlists(decade)
    response = cache.fetch("get-decade-playlists-#{decade}") do
      conn.get("search?type=playlist&q=#{decade}&market=us&limit=10")
    end
    parse(response)
  end

  def get_playlist(type, id, owner)
    response = cache.fetch("get-playlist-#{owner}-#{type}-#{id}") do
      conn.get("users/#{owner}/#{type}/#{id}")
    end
    parse(response)
  end

  def get_item(type, id)
    response = cache.fetch("get-item-#{type}-#{id}") do
      conn.get("#{type}/#{id}")
    end
    parse(response)
  end


  private

  def conn
    @_conn
  end

  def cache
    @_cache
  end

  def set_header(user)
    user.refresh_token_if_expired
    conn.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
