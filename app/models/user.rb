class User < ActiveRecord::Base

	def self.from_omniauth(auth)
		# via: http://stackoverflow.com/questions/25399414/rails-4-1-5-omniauth-strong-parameters
		where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid

      unless auth.info.blank?
        user.name = auth.info.name
        #user.screen_name = auth.info.screen_name
        #user.image = auth.info.image
      end

      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
      user.save!
    end
  end

end
