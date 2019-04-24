class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :nickname, :string
    add_column :users, :image_url, :string
    add_column :users, :remember_token, :string
  end
end
