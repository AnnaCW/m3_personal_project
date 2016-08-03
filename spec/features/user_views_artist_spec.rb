require "rails_helper"

feature "user views artist" do
  scenario "user sees artist name and top tracks" do
    VCR.use_cassette("artist-show") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit "/items/tracks/0WTEhNhRIfVyb73rJ6jRNK"

      click_on("Chuck Ragan")

      expect(current_path).to eq("/artists/6iU0naWn1UgiTReoiXqPXI")

      within("h2") do
        expect(page).to have_content("Chuck Ragan")
      end

      within("table") do
        expect(page).to have_content("California Burritos")
      end

    end
  end
end
