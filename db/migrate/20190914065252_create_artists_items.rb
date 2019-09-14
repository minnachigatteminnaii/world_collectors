class CreateArtistsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_items do |t|
      t.integer :artist_id, null: false
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
