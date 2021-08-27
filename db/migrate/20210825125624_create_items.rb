class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
