require "rails_helper"

describe SpotifyService do
  context "#categories" do
    it "returns a list of categories" do
      user = create(:user)
      VCR.use_cassette("categories") do

        result = SpotifyService.new(user).get_categories

        expect(result["categories"]["items"].count).to eq(31)
        expect(result["categories"]["items"].first["name"]).to eq("Top Lists")
      end
    end
  end

  context "#category" do
    it "finds a single category by id" do
      user = create(:user)
      category_id = "toplists"
      VCR.use_cassette("category") do

        result = SpotifyService.new(user).get_category(category_id)

        expect(result["name"]).to eq("Top Lists")
      end
    end

    it "finds playlists for category" do
      user = create(:user)
      category_id = "focus"
      VCR.use_cassette("category_playlists") do

        result = SpotifyService.new(user).get_category_playlists(category_id)

        expect(result["playlists"]["items"].count).to eq(20)
        expect(result["playlists"]["items"].first).to have_key("name")
        expect(result["playlists"]["items"].first).to have_key("tracks")
      end
    end
  end

  context "#genres" do
    it "gets genre seeds" do
      user = create(:user)
      VCR.use_cassette("genres") do
        result = SpotifyService.new(user).get_genre_seeds

        expect(result).to have_key("genres")
        expect(result["genres"].first).to eq("acoustic")
      end
    end

    it "finds genre suggestions" do
      user = create(:user)
      VCR.use_cassette("suggestions") do
        result = SpotifyService.new(user).get_suggestions({
                                          "seed_artists" => nil,
                                          "seed_tracks" => nil,
                                          "seed_genres" => "jazz"
                                            })
        expect( result["tracks"].count ).to eq(10)
        expect( result["tracks"].first ).to have_key("name")
        expect( result["tracks"].first["artists"].first ).to have_key("name")
        expect( result["tracks"].first["album"] ).to have_key("name")
        expect( result["tracks"].first ).to have_key("uri")
       end
     end
   end

end
