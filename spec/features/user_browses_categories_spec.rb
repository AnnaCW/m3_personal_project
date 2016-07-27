require 'rails_helper'

feature "user can browse categories" do
  scenario "user selects category; sees associated playlists" do
    VCR.use_cassette("browse-categories") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit "/"

      click_on "Browse Categories"

      expect(current_path).to eq(categories_path)

      click_on "Focus"

      expect(current_path).to eq(category_path("focus"))
      expect(page).to have_content("Peaceful Piano")
    end
  end
end
