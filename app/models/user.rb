class User < ApplicationRecord
  # validates :uid, presence: true, uniqueness: true
  # validates :screen_name, presence: true, uniqueness: true
  # validates :name, presence: true
  # validates :oauth_token, presence: true, uniqueness: true

  # def self.from_omniauth(auth_info)
  #   where(uid: auth_info[:uid]).find_or_create do |new_user|
  #     new_user.uid                = auth_info.uid
  #     new_user.name               = auth_info.extra.raw_info.name
  #     new_user.screen_name        = auth_info.extra.raw_info.login
  #     new_user.oauth_token        = auth_info.credentials.token
  #     new_user.oauth_token_secret = auth_info.credentials.secret
  #   end
  # end

  def self.find_or_create_from_auth(auth_info)
    User.find_or_create_by(
      provider: auth_info.provider,
      uid: auth_info.info.id,
      name: auth_info.info.display_name,
      screen_name: auth_info.info.id,
      oauth_token: auth_info.credentials.token,
      refresh_token: auth_info.credentials.refresh_token,
      expires_at: auth_info.credentials.expires_at
    )
  end
end
