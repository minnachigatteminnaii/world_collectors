class Item < ApplicationRecord
    has_many :users, through: :cart_items
    has_many :cart_items
    has_many :arrivals
    has_many :orders, through: :orders_items
    has_many :orders_items
    has_many :disks
    has_many :users, through: :favorites
    has_many :favorites
    belongs_to :artist
    belongs_to :genre

    

    validates :item_name, presence: true
    validates :artist_name, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :sales_management, presence: true
    validates :listing_stop, presence: true

    enum sales_management: { soldout: 0, onsale: 1 }
    enum listing_stop: { default: 0, stop: 1 }
end
