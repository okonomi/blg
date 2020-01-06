class CreateBlgTables < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :uid, null: false
      t.string :title
      t.integer :status, null: false, default: 0
      t.datetime :published_at, precision: 6, null: false
      t.timestamps

      t.index :uid, unique: true
    end

    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps

      t.index :name, unique: true
    end

    create_table :post_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
