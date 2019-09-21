class Music < ApplicationRecord
    belongs_to :disk

    #validates :disk_id, presence: true
    validates :name, presence: true, length: { maximum: 200, minimum: 1 }
    validates :song_order, presence: true, numericality: { only_integer: true }
end
