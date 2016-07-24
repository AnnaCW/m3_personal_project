class SpotifyService

  def initialize
    @_conn = Faraday.new("https://api.spotify.com/v1")
    # @_user = user
  end

  def get_categories(user)
    conn.headers["Authorization"] = "Bearer #{user.refresh_token}"
    response = conn.get("/browse/categories")
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
