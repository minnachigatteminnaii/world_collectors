class CreateShoppingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_addresses do |t|
      t.integer :user_id, null: false
      t.string :shopping_first_name, null: false
      t.string :shopping_last_name, null: false
      t.string :shopping_kana_first, null: false
      t.string :shopping_kana_last, null: false
      t.string :shopping_addresses_postal_code, null: false
      t.text :shopping_addresses_address, null: false
      t.string :shopping_addresses_phone_number, null: false

      t.timestamps
    end
  end
end
