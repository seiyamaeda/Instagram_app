OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '893933960645723', 'ed2dc4513f4192670952481ee4b75f31'
end
