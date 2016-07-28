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
end
