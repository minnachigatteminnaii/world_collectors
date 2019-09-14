class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :payment_methods, null: false
      t.string :delivery_first_name, null: false
      t.string :delivery_last_name, null: false
      t.string :delivery_kana_first, null: false
      t.string :delivery_kana_last, null: false
      t.string :delivery_postal, null: false
      t.text :delivery_address, null: false
      t.integer :delivery_price, null: false, default: 500
      t.integer :status, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
