require 'rails_helper'

describe "Suggestions Endpoint" do
  it "gets suggestions from current track" do
    VCR.use_cassette("suggestions-api") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      get "/api/v1/suggestions.json", params: { user_id: user.id, "seed_tracks" => "0WTEhNhRIfVyb73rJ6jRNK" }

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first["name"]).to be_a(String)
    end
  end
end
