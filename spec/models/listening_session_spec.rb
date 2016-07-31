require 'rails_helper'

RSpec.describe ListeningSession, type: :model do
  it "formats created_at and updated_at" do
    session = create(:listening_session, created_at: "2016-07-30 22:08:10",
                                         updated_at: "2016-07-31 08:00:10")

    expect(session.formatted_created_at).to eq("07/30/2016 10:08PM")
    expect(session.formatted_updated_at).to eq("07/31/2016 08:00AM")
  end

end
