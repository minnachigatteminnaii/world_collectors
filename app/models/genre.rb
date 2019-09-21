class Genre < ApplicationRecord
    has_many :items

    validates :name, presence: true, length: { maximum: 50, minimum: 1 }
end
