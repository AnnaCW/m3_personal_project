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
end
