class Artist < ApplicationRecord
    has_many :items

    validates :name, presence: true, length: { maximum: 100, minimum: 1 }

    
end
