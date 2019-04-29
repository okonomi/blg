module OmniAuthHelper
  def prepare_mock_auth_from(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      provider: 'github',
      uid: user.uid,
      info: {
        nickname: user.nickname,
        image: user.image_url
      }
    )
  end

  def authenticate_as(user)
    prepare_mock_auth_from(user)
    visit root_path
    click_link 'Login'
  end
end
