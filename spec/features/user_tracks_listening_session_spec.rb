require 'rails_helper'

feature "user records listening session" do
  scenario "starts a new listen" do
    VCR.use_cassette("new-listen") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit categories_path

      click_on "Focus"

      expect(page).to have_content("Peaceful Piano")

      click_on "Peaceful Piano"

      expect(current_path).to eq('/items/playlists/63dDpdoVHvx5RkK87g4LKk')

      within("h2") do
        expect(page).to have_content("Peaceful Piano")
      end

      click_on "Open Listening Session"

    end
  end
end
