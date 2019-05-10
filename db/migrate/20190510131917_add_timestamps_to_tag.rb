class AddTimestampsToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :created_at, :datetime, null: false, precision: 6
    add_column :tags, :updated_at, :datetime, null: false, precision: 6
  end
end
