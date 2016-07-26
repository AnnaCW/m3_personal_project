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

# feature "user can browse categories" do
#   scenario "user selects category; sees associated playlists" do
#   current_user = create(:user)
#   VCR.use_cassette("category_playlists") do
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
#
#       expect(current_path).to eq(categories_path)
#
#       click_on "Focus"
#
#       expect(currrent_path).to eq(category_path(category))
#       expect(page).to have_content("Peaceful Piano")
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
