class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :artist_name, null: false
      t.string :label_name
      t.string :genre
      t.string :category, null: false
      t.integer :price, null: false
      t.integer :stock, null: false, default: 0
      t.text :jacket_image_id
      t.integer :sales_management, null: false
      t.integer :listing_stop, null: false

      t.timestamps
    end
  end
end
