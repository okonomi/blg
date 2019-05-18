require "rails_helper"

RSpec.describe "Posts", type: :system, js: true do
  context "with logged in user" do
    before do
      user = build(:user)
      authenticate_as(user)
    end

    it "can create new post" do
      visit new_post_path

      fill_in "Title", with: "test title"
      fill_in_rich_text_area "Content", with: "test content"
      click_button "Create Post"

      expect(page).to have_content "test title"
      expect(page).to have_content "test content"
    end

    it "can update post" do
      post = Post.create!(title: "test", content: "test")
      visit edit_post_path(post)

      fill_in "Title", with: "update title"
      fill_in_rich_text_area "Content", with: "update content"
      click_button "Update Post"

      expect(page).to have_content "update title"
      expect(page).to have_content "update content"
    end
  end

  it "show post" do
    post = Post.create!(title: "test title", content: "test content")
    visit post_path(post)

    expect(page).to have_content "test title"
    expect(page).to have_content "test content"
  end
end
