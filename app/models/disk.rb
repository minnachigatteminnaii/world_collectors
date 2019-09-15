class Disk < ApplicationRecord
    belongs_to :item
    has_many :musics

    validates :item_id, presence: true
    validates :name, presence: true
end
