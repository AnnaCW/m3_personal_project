require 'rails_helper'

RSpec.describe User, type: :model do

  context "#user" do
    it "identifies expired token" do
      VCR.use_cassette("user") do
        user = create(:user)
        user_expired = create(:expired_user, expires_at: "1469642331")

        expect(user.token_expired?).to eq(false)
        expect(user.refresh_token_if_expired).to eq(nil)

        expect(user_expired.token_expired?).to eq(true)
      end
    end

    it "updates attributes" do
      user = create(:user)
      refreshhash = { "access_token" => "123abc", "expires_in" => "3600" }
      user.update_with_refresh_hash(refreshhash)

      updated_user = User.find(user.id)

      expect(updated_user.oauth_token).to eq("123abc")
      expect(updated_user.expires_at).to eq( (Time.now.to_i + 3600).to_s )
    end

  end
end
