FactoryGirl.define do
  factory :user do
    uid "aweisbro8"
    screen_name "aweisbro8"
    oauth_token ENV['OAUTH_TOKEN']
    refresh_token ENV['REFRESH_TOKEN']
    expires_at ENV['EXPIRES_AT']
    role 0
  end

  factory :expired_user, class: User do
    uid "aweisbro8"
    screen_name "aweisbro8"
    oauth_token ENV['E-OAUTH_TOKEN']
    refresh_token ENV['E-REFRESH_TOKEN']
    expires_at ENV['E-EXPIRES_AT']
    role 0
  end


  factory :listening_session do
    user
    item_name "My Favorite Song"
    item_id "lne0ppqrw"
    item_type "track"
    playlist_owner_id nil
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
