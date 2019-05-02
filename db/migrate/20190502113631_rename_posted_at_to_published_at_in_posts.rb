class RenamePostedAtToPublishedAtInPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :posted_at, :published_at
  end
end
