require 'rest-client'

class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.info.id
      new_user.provider = auth_info.provider
      new_user.name = auth_info.info.display_name
      new_user.screen_name = auth_info.info.id
      new_user.oauth_token = auth_info.credentials.token
      new_user.refresh_token = auth_info.credentials.refresh_token
      new_user.expires_at = auth_info.credentials.expires_at
    end
  end

  # def self.find_or_create_from_auth(auth_info)
  #    user = User.find_or_create_by(
  #           provider: auth_info.provider,
  #           uid: auth_info.info.id,
  #           name: auth_info.info.display_name,
  #           screen_name: auth_info.info.id,
  #           oauth_token: auth_info.credentials.token,
  #           refresh_token: auth_info.credentials.refresh_token,
  #           expires_at: auth_info.credentials.expires_at
  #         )
  # end

  def refresh_token_if_expired
    if token_expired?
      response    = RestClient.post "https://accounts.spotify.com/api/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['SPOTIFY_KEY'], :client_secret => ENV['SPOTIFY_SECRET']
      refreshhash = JSON.parse(response.body)

      # oauth_token_will_change!
      # expiresat_will_change!

      self.oauth_token     = refreshhash['access_token']
      self.expires_at = DateTime.now + refreshhash["expires_in"].to_i.seconds

      self.update_attributes(
        oauth_token: refreshhash['access_token'],
        expires_at: DateTime.now + refreshhash["expires_in"].to_i.seconds
      )

      # self.save
      puts 'Saved'
    end
  end

  def token_expired?
    expiry = Time.at(self.expires_at.to_i.seconds)
    return true if expiry < Time.now # expired token, so we should quickly return
    token_expires_at = expiry
    save if changed?
    false # token not expired. :D
  end

end
