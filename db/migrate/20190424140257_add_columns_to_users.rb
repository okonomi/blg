class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :uid
      t.string :nickname
      t.string :image_url
      t.string :remember_token
    end
  end
end
