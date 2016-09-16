require 'rails_helper'

describe "Categories Endpoint" do
  it "retrieves categories" do
    VCR.use_cassette("categories-api") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      get "/api/v1/categories.json", params: { user_id: user.id}

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first.name).to be_a(String)
    end
  end
end
