require "rails_helper"

describe "Artist" do
  def user
    create(:user)
  end

  context "#artist" do
    it "finds artist by id" do
      VCR.use_cassette("artist-find") do
        artist = Artist.find(user, "43ZHCT0cAZBISjO8DG9PnE")

        expect(artist.name).to eq("Elvis Presley")
        expect(artist.genres).to eq(["rock-and-roll", "rockabilly"])
        expect(artist.id).to eq("43ZHCT0cAZBISjO8DG9PnE")
      end
    end

    it "finds artist's top tracks" do
      VCR.use_cassette("artist-find-top-tracks") do
        tracks = Artist.top_tracks(user, "43ZHCT0cAZBISjO8DG9PnE")

        expect(tracks.first.name).to eq("Can't Help Falling in Love")
      end
    end
  end
end
