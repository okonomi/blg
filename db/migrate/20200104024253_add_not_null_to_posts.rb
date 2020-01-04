class AddNotNullToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :uid, false
    change_column_null :posts, :published_at, false
  end
end
