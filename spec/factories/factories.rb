FactoryGirl.define do
  factory :user do
    uid "aweisbro8"
    screen_name "aweisbro8"
    oauth_token ENV['OAUTH_TOKEN']
    refresh_token ENV['REFRESH_TOKEN']
    expires_at ENV['EXPIRES_AT']
  end
end
