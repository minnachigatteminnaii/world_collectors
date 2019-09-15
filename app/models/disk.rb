class Disk < ApplicationRecord
    belongs_to :item
    has_many :musics, inverse_of: :disk

    accepts_nested_attributes_for :musics, allow_destroy: true, reject_if: :all_blank

    validates :item_id, presence: true
    validates :name, presence: true
end
