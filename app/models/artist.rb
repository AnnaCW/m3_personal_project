class Artist

  def self.service(user)
    @@service ||= SpotifyService.new(user)
  end

  def self.find(user, id)
    raw_artist = Artist.service(user).get_artist(id)
    OpenStruct.new(raw_artist)
  end

  def self.top_tracks(user, id)
    result = Artist.service(user).get_artist_top_tracks(id)
    result["tracks"].map do |raw_track|
      OpenStruct.new(raw_track)
    end
  end

end
