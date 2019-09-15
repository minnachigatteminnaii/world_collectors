class Order < ApplicationRecord
    belongs_to :user
    has_many :items, through: :orders_items
    has_many :orders_items

    validates :user_id, presence: true
    validates :payment_methods, presence: true
    validates :delivery_first_name, presence: true
    validates :delivery_last_name, presence: true
    validates :delivery_kana_first, presence: true
    validates :delivery_kana_last, presence: true
    validates :delivery_postal, presence: true
    validates :delivery_address, presence: true
    validates :delivery_price, presence: true
    validates :status, presence: true
    validates :total_price, presence: true

    enum status: { receiving: 0, preparation: 1, shipped: 2}
    enum payment_methods: { cash: 0, bank: 1, credit: 2 }
end
