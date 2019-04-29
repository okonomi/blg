require 'rails_helper'

RSpec.describe 'Authentication', type: :system do
  let(:user) { User.new }

  it 'login' do
    authenticate_as(user)
    expect(page).to have_content I18n.t('flash.logged_in')
  end

  it 'logout' do
    authenticate_as(user)
    click_link 'Logout'
    expect(page).to have_content I18n.t('flash.logged_out')
  end
end
