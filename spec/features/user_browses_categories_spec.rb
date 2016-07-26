require 'rails_helper'

# OmniAuth.config.test_mode = true
#   OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
#     provider: 'spotify',
#     info: {
#       id: "aweisbro8",
#       display_name: "nil"
#     },
#     credentials: {
#       token: ENV['OAUTH_TOKEN'],
#       refresh_token: ENV['REFRESH_TOKEN'],
#       expires_at: ENV['EXPIRES_AT']
#       }
#     })
#
# feature "user can browse categories" do
#   scenario "user selects category; sees associated playlists" do
#     user = create(:user)
#
#     VCR.use_cassette("browse-categories") do
#
#       visit "/"
#
#       expect(page).to_not have_content "Browse Categories"
#
#       click_on "LogIn"
#
#       expect(page).to have_content "Logged in"
#       expect(page).to have_content "Browse Categories"
#
#       click_on "Browse Categories"
#       #
#       # expect(current_path).to eq(categories_path)
#       #
#       # click_on "Focus"
#       #
#       # expect(current_path).to eq(category_path("focus"))
#       # expect(page).to have_content("Peaceful Piano")
#     end
#   end
# end

# As a logged in user with no prior spotify activity
# When I visit the home page
# I see an option to "browse categories"
# When I click the button
# I go to the categories page
# I can click on a category
# and see playlists for that category
