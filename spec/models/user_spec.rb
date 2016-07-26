require 'rails_helper'

RSpec.describe User, type: :model do

  context "#user" do
    it "updates user attributes" do
      VCR.use_cassette("user") do
        user = create(:user)
        user_expired = create(:user, expires_at: "1469489603")

        expect(user.token_expired?).to eq(false)
        expect(user.refresh_token_if_expired).to eq(nil)

        expect(user_expired.token_expired?).to eq(true)
      end
    end
  end

end
