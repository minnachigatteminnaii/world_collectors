class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.integer :item_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
