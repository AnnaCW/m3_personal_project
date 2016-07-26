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
    return true if expiry < Time.now
    token_expires_at = expiry
    save if changed?
    false
  end

end
