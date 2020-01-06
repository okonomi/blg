class AddUniqueToPostsUid < ActiveRecord::Migration[6.0]
  def change
    remove_index :posts, column: :uid
    add_index    :posts, :uid, unique: true
  end
end
