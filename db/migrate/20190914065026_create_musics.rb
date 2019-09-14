class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :disk_id, null: false
      t.string :name, null: false
      t.integer :song_order, null: false

      t.timestamps
    end
  end
end
