require 'rails_helper'

feature "user gets suggestions" do
  scenario "user selects seed genre" do
    VCR.use_cassette("suggestions-genre") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit "/"

      click_on "Find Suggestions"

      expect(current_path).to eq(suggestions_path)

      select "jazz", from: "genre"
      within("div.genre") do
        click_on "GET!"
      end

      expect(current_path).to eq(suggestions_path)
      expect(page).to have_content("Top Jazz Selections")

    end
  end

  scenario "user selects decade" do
    VCR.use_cassette("suggestions-decade") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit "/"

      click_on "Find Suggestions"

      expect(current_path).to eq(suggestions_path)

      select "1940s", from: "decade"
      within("div.decade") do
        click_on "GET!"
      end

      expect(current_path).to eq(suggestions_path)
      expect(page).to have_content("1940s Playlists")

    end
  end
end
