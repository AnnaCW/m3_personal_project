require 'rails_helper'

feature "user records listening session" do
  scenario "starts a new listen" do
    VCR.use_cassette("new-listen") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit categories_path

      click_on "Focus"

      expect(page).to have_content("Peaceful Piano")

      within ("#Peaceful") do
        click_on "Create New Listen"
      end

      click_on "Go To My Listening Sessions"

      within (".listens#Peaceful") do
        click_on "Add Notes"
      end

      fill_in "Notes", with: "These are notes on this session"
      select "10", from: "Rating"
      click_on "Update"

      expect(page).to have_content "Listen Updated!"
    end
  end
end
