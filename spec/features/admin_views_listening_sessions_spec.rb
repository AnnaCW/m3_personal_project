require 'rails_helper'

feature "admin views all listening sessions" do
  scenario "admin sees option to export csv" do
    VCR.use_cassette("admin") do
      user = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    end
  end
end
