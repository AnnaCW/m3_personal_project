class Item

  def self.service(user)
    @@service ||= SpotifyService.new(user)
  end

  def self.find(user, type, id, owner)
    if type == "playlists"
      raw_item = Item.service(user).get_playlist(type, id, owner)
    else
      raw_item = Item.service(user).get_item(type, id)
    end
    OpenStruct.new(raw_item)
  end
end
