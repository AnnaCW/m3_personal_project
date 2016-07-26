require "rails_helper"

describe SpotifyService do
  context "#categories" do
    it "returns a list of categories" do
      user = create(:user)
      VCR.use_cassette("categories") do

        result = SpotifyService.new.get_categories(user)

        expect(result["categories"]["items"].count).to eq(20)
        expect(result["categories"]["items"].first["name"]).to eq("Top Lists")
      end
    end
  end

  context "#category" do
    it "finds a single category by id" do
      user = create(:user)
      category_id = "toplists"
      VCR.use_cassette("category") do

        result = SpotifyService.new.get_category(user, category_id)

        expect(result["name"]).to eq("Top Lists")
      end
    end

    it "finds playlists for category" do
      user = create(:user)
      category_id = "focus"
      VCR.use_cassette("category_playlists") do

        result = SpotifyService.new.get_category_playlists(user, category_id)

        expect(result["playlists"]["items"].count).to eq(20)
        expect(result["playlists"]["items"].first).to have_key("name")
        expect(result["playlists"]["items"].first).to have_key("tracks")
      end
    end
  end
end
