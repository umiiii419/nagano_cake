class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at

      t.references :customer, foreign_key: true, null: false

      t.timestamps
    end
  end
end
