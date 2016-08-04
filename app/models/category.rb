class Category

  def self.service(user)
    @@service ||= SpotifyService.new(user)
  end

  def self.all(user)
    raw_categories = Category.service(user).get_categories
    raw_categories["categories"]["items"].map do |raw_category|
      OpenStruct.new(raw_category)
    end
  end

  def self.popular(user)
    self.all(user).select do |category|
      self.popular_ids.include?(category["id"])
    end
  end

  def self.popular_ids
    %w(toplists focus dinner sleep travel decades jazz blues classical)
  end

  def self.find(user, category_id)
    Category.service(user).get_category(category_id)
  end

  def self.playlists(user, category_id)
    raw_playlists = Category.service(user).get_category_playlists(category_id)
    playlists = raw_playlists["playlists"]["items"].map do |raw_playlist|
      OpenStruct.new(raw_playlist)
    end
    playlists.select do |playlist|
      playlist.owner["id"] == "spotify"
    end
  end

end
