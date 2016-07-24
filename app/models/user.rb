class User < ApplicationRecord

  def self.find_or_create_from_auth(auth_info)
    # user = find_or_create_by(uid: auth_info[:uid])
    # user.update_attributes(
     user = User.find_or_create_by(
            provider: auth_info.provider,
            uid: auth_info.info.id,
            name: auth_info.info.display_name,
            screen_name: auth_info.info.id,
            oauth_token: auth_info.credentials.token,
            refresh_token: auth_info.credentials.refresh_token,
            expires_at: auth_info.credentials.expires_at
          )
    #   user.update_attributes(
    #     # provider: auth_info.provider,
    #     uid: auth_info.info.id,
    #     name: auth_info.info.display_name,
    #     screen_name: auth_info.info.id,
    #     oauth_token: auth_info.credentials.token,
    #     refresh_token: auth_info.credentials.refresh_token,
    #     expires_at: auth_info.credentials.expires_at
    # )
  end
end
