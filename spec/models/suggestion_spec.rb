require "rails_helper"

RSpec.describe Suggestion, type: :model do

  def user
    create(:user)
  end

  context "#suggestions" do
    it "finds genre seeds" do
      VCR.use_cassette("genres") do
        genres = Suggestion.genres(user)

        expect(genres).to be_an(Array)
        expect(genres.count).to be >= 10
      end
    end

    it "gets suggestions from genre seed" do
      VCR.use_cassette("suggestions") do

        suggestions = Suggestion.get_from_seeds(user, {
                                        "seed_artists" => nil,
                                        "seed_tracks" => nil,
                                        "seed_genres" => "jazz"
                                          })

        expect(suggestions.count).to eq(10)
        expect(suggestions.first.name).to be_a(String)
      end
    end

  end
end
