class Disk < ApplicationRecord
    belongs_to :item
    has_many :musics, inverse_of: :disk, dependent: :destroy
    accepts_nested_attributes_for :musics, 
          reject_if: :all_blank, allow_destroy: true

    validates :item_id, presence: true
    validates :name, presence: true


		
end
