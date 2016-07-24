class Category

  def self.service
    @@service = SpotifyService.new
  end

  def self.all(user)
    Category.service.get_categories(user)
  end

  def self.popular(user)
    self.all(user)["categories"]["items"].select do |category|
      category["id"] == "toplists" || category["id"] == "focus"
    end
  end

  def self.find(user, category_id)
    Category.service.get_category(user, category_id)
  end

  def self.playlists(user, category_id)
    Category.service.get_playlists(user, category_id)
  end
end
