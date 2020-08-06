class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.datetime :confirmed_at
      t.datetime :submited_at
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
