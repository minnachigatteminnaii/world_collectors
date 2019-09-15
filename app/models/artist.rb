class Artist < ApplicationRecord
    has_many :items, through: :artists_items
    has_many :artists_items

    validates :name, presence: true
end
