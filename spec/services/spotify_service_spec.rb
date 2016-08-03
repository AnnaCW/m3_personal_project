require "rails_helper"

def user
  create(:user)
end

describe SpotifyService do
  context "#categories" do
    it "returns a list of categories" do
      VCR.use_cassette("categories") do
        result = SpotifyService.new(user).get_categories

        expect(result["categories"]["items"].count).to eq(31)
        expect(result["categories"]["items"].first["name"]).to eq("Top Lists")
      end
    end
  end

  context "#category" do
    it "finds a single category by id" do
      category_id = "toplists"
      VCR.use_cassette("category") do

        result = SpotifyService.new(user).get_category(category_id)

        expect(result["name"]).to eq("Top Lists")
      end
    end

    it "finds playlists for category" do
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
      VCR.use_cassette("genres") do
        result = SpotifyService.new(user).get_genre_seeds

        expect(result).to have_key("genres")
        expect(result["genres"].first).to eq("acoustic")
      end
    end

    it "finds genre suggestions" do
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

    context "#tracks" do
     it "finds track suggestions" do
       VCR.use_cassette("suggestions-track") do
         result = SpotifyService.new(user).get_suggestions({
                                           "seed_artists" => nil,
                                           "seed_tracks" => "0WTEhNhRIfVyb73rJ6jRNK",
                                           "seed_genres" => nil
                                             })

         expect( result["tracks"].count ).to be > 1
      end
    end
   end

   context "#artists" do
     it "gets artist" do
       VCR.use_cassette("artist") do
         result = SpotifyService.new(user).get_artist("0OdUWJ0sBjDrqHygGUXeCF")

         expect(result["genres"]).to eq(["indie folk", "indie pop"])
         expect(result["name"]).to eq("Band of Horses")
       end
     end

     it "gets artist's top tracks" do
       VCR.use_cassette("artist-top-tracks") do
         result = SpotifyService.new(user).get_artist_top_tracks("43ZHCT0cAZBISjO8DG9PnE")

         expect(result["tracks"].first["album"]["name"]).to eq("Blue Hawaii")
       end
     end
   end

end
