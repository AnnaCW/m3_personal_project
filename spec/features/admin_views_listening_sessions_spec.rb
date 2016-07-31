require 'rails_helper'

feature "admin views all listening sessions" do
  scenario "admin sees option to export csv" do
    VCR.use_cassette("admin") do
      user = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit admin_listening_sessions_path

      expect(page).to have_content("Export CSV")
    end
  end
end
