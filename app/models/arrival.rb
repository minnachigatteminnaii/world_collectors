class Arrival < ApplicationRecord
    belongs_to :item

    validates :item_id, presence: true
    validates :arrival_date, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true }
end
