class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :artist_id, null: false
      t.integer :genre_id, null: false
      t.string :label_name
      t.string :category
      t.integer :price, null: false
      t.integer :stock, null: false, default: 0
      t.text :jacket_image_id
      t.integer :sales_management, null: false, default: 0
      t.integer :listing_stop, null: false, default: 0

      t.timestamps
    end
  end
end
