require 'rails_helper'

feature "user records listening session" do
  scenario "user sees option to open a new session on item show page" do
    VCR.use_cassette("new-listen") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit categories_path

      click_on "Focus"

      expect(page).to have_content("Peaceful Piano")

      click_on "Peaceful Piano"

      expect(current_path).to eq('/items/playlists/63dDpdoVHvx5RkK87g4LKk.spotify')

      within("h2") do
        expect(page).to have_content("Peaceful Piano")
      end

      click_on "Open Listening Session"
    end
  end

  scenario "user can view all listening sessions" do
    user = create(:user)
    listening_session_1 = create(:listening_session, user: user, item_name: "My Favorite Track")
    listening_session_2 = create(:listening_session, user: user, item_name: "Another Track")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit "/"

    within(".navbar") do
      click_on "My Listening Sessions"
    end

    within("h2") do
      expect(page).to have_content("My Listening Sessions")
    end
  end
end
