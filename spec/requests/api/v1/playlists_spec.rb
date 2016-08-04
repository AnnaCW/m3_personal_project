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

  it "adds track to playlists" do
    VCR.use_cassette("add-to-playlists-api") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      patch "/api/v1/playlists/4dt3ZZtRzAYvCKwg0qY7Ai.json", params: {user_id: user.id, playlist_id: "4dt3ZZtRzAYvCKwg0qY7Ai", track_uri: "spotify:track:5KL4iZkCTZyXl7KnHgfVDj"}

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response).to eq( {"snapshot_id"=>"gRQgAw3XO6gakdDIfSY3ou4rczzzmLb7dRpKbe0WIvqGRHXEBEIhzeusvnIu80g5"} )
    end
  end

  it "creates new playlist" do
    VCR.use_cassette("create-playlist-api") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      post "/api/v1/playlists", params: {user_id: user.id, playlist_name: "Turing Tracks"}

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["name"]).to eq("Turing Tracks")
    end
  end
end
