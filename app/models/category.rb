class Category

  def self.service
    @@service ||= SpotifyService.new
  end

  def self.all(user)
    raw_categories = Category.service.get_categories(user)
    raw_categories["categories"]["items"].map do |raw_category|
      OpenStruct.new(raw_category)
    end
  end

  def self.popular(user)
    self.all(user).select do |category|
      # category["id"] == "toplists" || category["id"] == "focus"
      self.popular_ids.include?(category["id"])
    end
  end

  def self.popular_ids
    %w(toplists focus dinner sleep travel decades jazz blues classical)
  end

  def self.find(user, category_id)
    Category.service.get_category(user, category_id)
  end

  def self.playlists(user, category_id)
    Category.service.get_category_playlists(user, category_id)
  end
end
