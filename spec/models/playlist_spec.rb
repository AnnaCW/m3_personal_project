require "rails_helper"

RSpec.describe Playlist, type: :model do

  def user
    create(:user)
  end

  context "#playlists" do
    it "returns user playlists" do
      VCR.use_cassette("user-playlists") do

      playlists = Playlist.all(user)

      expect(playlists.first.name).to eq("Test Playlist")
      end
    end
  end

end
