OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '**********', '**********'
end
