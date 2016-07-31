require 'rails_helper'

feature "admin views all listening sessions" do
  scenario "admin sees option to export csv" do
    admin = create(:user, role: 1)
    listening_session_1 = create(:listening_session, item_name: "Session 1")
    listening_session_2 = create(:listening_session, item_name: "Session 2")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )

    visit '/'

    within (".navbar") do
      click_on "Admin"
    end

    expect(page).to have_content("Export CSV")

    within("table") do
      expect(page).to have_content("Session 1")
      expect(page).to have_content("Session 2")
    end
  end

  scenario "non-admin view admin page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit '/'

    within (".navbar") do
      expect(page).to_not have_content("Admin")
    end

    visit admin_listening_sessions_path

    expect(page).to have_content("404")
  end
end
