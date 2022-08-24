OmniAuth.config.logger = Rails.logger

if Rails.env.production?
  OmniAuth.config.full_host = ENV["OMNIAUTH_FULL_HOST"]
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :github,
    ENV["GITHUB_OAUTH_CLIENT_KEY"],
    ENV["GITHUB_OAUTH_CLIENT_SECRET"],
  )
end
