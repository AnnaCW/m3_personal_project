class Category < OpenStruct

  def self.service
    @@service = SpotifyService.new
  end

  def self.all(user)
    Category.service.get_categories(user)
  end
end
