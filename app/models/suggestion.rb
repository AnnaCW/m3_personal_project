class Suggestion

  def self.service(user)
    @@service ||= SpotifyService.new(user)
  end

  def self.genres(user)
    response_object = Suggestion.service(user).get_genre_seeds
    response_object["genres"]
  end

  def self.get_from_seeds(user, seeds)
    response_object = Suggestion.service(user).get_suggestions(seeds)

    response_object["tracks"].map do |raw_suggestion|
      OpenStruct.new(raw_suggestion)
    end
  end

  def self.decade_playlists(user, decade)
    response_object = Suggestion.service(user).get_decade_playlists(decade)

    response_object["playlists"]["items"].map do |raw_playlist|
      OpenStruct.new(raw_playlist)
    end
  end

  def self.decades
    %w(1920s 1930s 1940s 1950s 1960s 1970s 1980s 1990s 2000s)
  end
end
