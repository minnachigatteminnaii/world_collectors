class ArtistsItem < ApplicationRecord
    belongs_to :artist
    belongs_to :item

    validates :artist_id, presence: true
    validates :item_id, presence: true
end
