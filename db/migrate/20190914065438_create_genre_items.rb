class CreateGenreItems < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_items do |t|
      t.integer :genre_id, null: false
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
