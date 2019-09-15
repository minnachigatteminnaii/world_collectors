class ShoppingAddress < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true
    validates :shopping_first_name, presence: true
    validates :shopping_last_name, presence: true
    validates :shopping_kana_first, presence: true
    validates :shopping_kana_last, presence: true
    validates :shopping_addresses_postal_code, presence: true
    validates :shopping_addresses_address, presence: true
    validates :shopping_addresses_phone_number, presence: true
end
