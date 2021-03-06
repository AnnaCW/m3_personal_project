require 'rails_helper'

describe "ListeningSessions Endpoint" do
  it "creates a new listening session" do
    ls_params = {notes: "This is a note", duration: 30}

    post "/api/v1/listening_sessions.json", params: {listening_session: ls_params}

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["notes"]).to eq("This is a note")
    expect(parsed_response["duration"]).to eq(30)
  end

  it "updates a listening session" do
    ls = create(:listening_session, duration: 60)
    update_params = {notes: "Revised Note"}

    patch "/api/v1/listening_sessions/#{ls.id}.json", params: {listening_session: update_params}

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["notes"]).to eq("Revised Note")
    expect(parsed_response["duration"]).to eq(60)
  end

  it "deletes a listening session" do
    ls = create(:listening_session)

    delete "/api/v1/listening_sessions/#{ls.id}.json"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["id"]).to eq(ls.id)
  end
end
