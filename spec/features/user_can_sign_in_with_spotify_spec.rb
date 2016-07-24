require 'rails_helper'

OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
    provider: 'spotify',
    info: {
      id: "1234",
      name: "Anna",
      screen_name: "aw123"
    },
    credentials: {
      token: "token1",
      refresh_token: "refreshtoken"
      }
    })

feature "user can sign in with spotify" do
  scenario "user logs in and out successfully" do
    visit root_path
    click_on "LogIn"

    expect(current_path).to eq "/"
    expect(page).to have_content "Logged in"
    expect(page).to have_link "Logout"

    click_on "Logout"

    expect(current_path).to eq "/"
    expect(page).to_not have_content "Logged in"
    expect(page).to have_link "LogIn"
  end
end
