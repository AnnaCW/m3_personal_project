class Suggestion

  def self.service(user)
    @@service ||= SpotifyService.new(user)
  end

  def self.genres(user)
    result = Suggestion.service(user).get_genre_seeds
    result["genres"]
  end
end
