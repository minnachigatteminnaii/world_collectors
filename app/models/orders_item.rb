class OrdersItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    validates :item_id, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true }
    validates :price, presence: true, numericality: { only_integer: true }
end
