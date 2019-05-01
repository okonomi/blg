class AddPostedAtToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :posted_at, :datetime, precision: 6
  end
end
