class GenreItem < ApplicationRecord
    belongs_to :genre
    belongs_to :item

    validates :genre_id, presence: true
    validates :item_id, presence: true
end
