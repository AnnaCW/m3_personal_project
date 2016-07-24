require "rails_helper"

describe SpotifyService do
  context "#categories" do
    it "returns a list of categories" do
      VCR.use_cassette("categories") do
        categories = SpotifyService.new.categories(user)
        category = categories.first

        expect(categories.count).to eq(20)
        expect(category[:name]).to eq("")
      end
    end
  end
end
