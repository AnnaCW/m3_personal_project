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

  end
end
