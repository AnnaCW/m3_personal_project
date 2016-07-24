require "rails_helper"

describe SpotifyService do
  context "#categories" do
    it "returns a list of categories" do
      VCR.use_cassette("categories") do
        categories = SpotifyService.new.get_categories(user)
        
        expect(categories.count).to eq(20)
        expect(categories["categories"]["items"]["name"]).to eq("Top Lists")
      end
    end
  end
end
