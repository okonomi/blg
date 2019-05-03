class AddUidToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :uid, :string
    add_index :posts, :uid
  end
end
