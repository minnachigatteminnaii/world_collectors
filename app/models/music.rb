class Music < ApplicationRecord
    belongs_to :disk, optional: true 

    validates :disk_id, presence: true
    validates :name, presence: true
    validates :song_order, presence: true
end
