require 'rails_helper'

OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    extra: {
    raw_info: {
      user_id: "1234",
      name: "Anna",
      screen_name: "aw123"
    }
  },
  credentials: {
    token: "token1",
    secret: "secret123"
    }
  })

feature "user can sign in with github" do
  scenario "user logs in and out successfully" do
    visit root_path
    click_on "LogIn"

    expect(current_path).to eq "/"
    expect(page).to have_content "Logged in as Anna"
    expect(page).to have_link "Logout"

    click_on "Logout"

    expect(current_path).to eq "/"
    expect(page).to_not have_content "Logged in as Anna"
    expect(page).to have_link "LogIn"
  end
end
