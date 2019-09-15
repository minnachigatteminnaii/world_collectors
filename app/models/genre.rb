class Genre < ApplicationRecord
    has_many :items, through: :genres_items
    has_many :genres_items

    validates :name, presence: true
end
