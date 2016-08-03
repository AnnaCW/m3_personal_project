require "rails_helper"

describe "Playlists Endpoint" do
  it "gets user's playlists" do
    VCR.use_cassette("get-playlists-api") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      get "/api/v1/playlists.json", params: {user_id: user.id}

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first["table"]["name"]).to be_a(String)
    end
  end
end
