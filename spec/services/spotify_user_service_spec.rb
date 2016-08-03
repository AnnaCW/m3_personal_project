require "rails_helper"

describe SpotifyUserService do
  def user
    create(:user)
  end

  context "#playlists" do
    it "creates a new playlist" do
      VCR.use_cassette("create-playlist") do
        result = SpotifyUserService.new(user).create_playlist("Test Playlist")

        expect(result["name"]).to eq("Test Playlist")
        expect(result["owner"]["id"]).to eq("aweisbro8")
        expect(result["tracks"]["items"]).to eq([])
        expect(result["id"]).to eq("4dt3ZZtRzAYvCKwg0qY7Ai")
      end
    end

    it "adds tracks to playlist" do
      VCR.use_cassette("add-track") do
        result = SpotifyUserService.new(user).add_track("4dt3ZZtRzAYvCKwg0qY7Ai", "spotify:track:4iV5W9uYEdYUVa79Axb7Rh")

        expect(result["snapshot_id"]).to be_a(String)
        # "hqsD+JimhCiAqRq4Ux3oDSDBhC8WWXnRr6pKO/H2/4ZZy2BXPwt+i94lvSO/aAeF"
      end
    end

    it "finds user's playlists" do
      VCR.use_cassette("find-playlists") do
        result = SpotifyUserService.new(user).get_user_playlists

        expect(result["items"].first["name"]).to be_a(String)

      end
    end

    it "finds tracks for playlist" do
      VCR.use_cassette("find-tracks") do
        result = SpotifyUserService.new(user).search_tracks("miles davis blue")

        expect(result["tracks"]["items"].first["name"]).to be_a(String)
      end
    end
  end

end
