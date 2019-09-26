class Item < ApplicationRecord
    has_many :users, through: :cart_items
    has_many :cart_items
    has_many :arrivals
    has_many :orders, through: :orders_items
    has_many :orders_items

    has_many :disks, inverse_of: :item, dependent: :destroy
    accepts_nested_attributes_for :disks,
                    reject_if: :all_blank, allow_destroy: true

    has_many :users, through: :favorites
    has_many :favorites
    belongs_to :artist
    belongs_to :genre



    validates :item_name, presence: true, length: { maximum: 200, minimum: 1 }
    validates :artist_id, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    validates :sales_management, presence: true
    validates :listing_stop, presence: true
    validates :label_name, length: { maximum: 100 }
    validates :category, length: { maximum: 50 }

    enum sales_management: { soldout: 0, onsale: 1 }
    enum listing_stop: { default: 0, stop: 1 }

    attachment :jacket_image
end