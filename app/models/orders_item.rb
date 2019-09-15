class OrdersItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    validates :user_id ,presence: true
    validates :item_id, presence: true
    validates :quantity, presence: true
end
