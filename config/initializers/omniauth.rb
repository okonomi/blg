OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :github,
    ENV.fetch("GITHUB_OAUTH_CLIENT_KEY"),
    ENV.fetch("GITHUB_OAUTH_CLIENT_SECRET"),
  )
end
