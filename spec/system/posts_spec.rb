require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  context 'with logged in user' do
    before do
      user = build(:user)
      authenticate_as(user)
    end

    it 'can create new post' do
      visit new_post_path

      fill_in 'Title', with: 'test'
      fill_in 'Content', with: 'test'
      click_button 'Create Post'
    end

    it 'can update post' do
      post = Post.create!(title: 'test', content: 'test')
      visit edit_post_path(post)

      click_button 'Update Post'
    end
  end

  it 'show post' do
    post = Post.create!(title: 'test', content: 'test')
    visit post_path(post)

    # expect(page).to have_http_status 200
  end
end
