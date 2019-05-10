class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
    end
    add_index :tags, :name, unique: true
  end
end
