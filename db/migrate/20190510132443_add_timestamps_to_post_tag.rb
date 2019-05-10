class AddTimestampsToPostTag < ActiveRecord::Migration[6.0]
  def change
    add_column :post_tags, :created_at, :datetime, null: false, precision: 6
    add_column :post_tags, :updated_at, :datetime, null: false, precision: 6
  end
end
