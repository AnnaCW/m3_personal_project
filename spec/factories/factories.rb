FactoryGirl.define do
  factory :user do
    uid "aweisbro8"
    screen_name "aweisbro8"
    oauth_token ENV['OAUTH_TOKEN']
    refresh_token ENV['REFRESH_TOKEN']
    expires_at ENV['EXPIRES_AT']
  end

  factory :listening_session do
    user
    item_name "My Favorite Song"
    item_id "lne0ppqrw"
    item_type "track"
    notes "This is a note"
    agitation_before 4
    agitation_after 3
    awareness_before 3
    awareness_after 3
    communicativeness_before 3
    communicativeness_after 4
    duration 45
  end
end
