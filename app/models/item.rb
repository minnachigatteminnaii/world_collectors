class Item < ApplicationRecord
    has_many :users, through: :cart_items
    has_many :cart_items
    has_many :arrivals
    has_many :orders, through: :orders_items
    has_many :orders_items
    has_many :disks, invers_of: :item
    has_many :artists, through: :artists_items
    has_many :artists_items
    has_many :genres, through: :genres_items
    has_many :genres_items
    has_many :users, through: :favorites
    has_many :favorites

    accepts_nested_attributes_for :disks, allow_destroy: true, reject_if: :all_brank

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
