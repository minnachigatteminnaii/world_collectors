class Disk < ApplicationRecord
    belongs_to :item
    has_many :musics, inverse_of: :disk, dependent: :destroy
    accepts_nested_attributes_for :musics, reject_if: :reject_musics, allow_destroy: true

    validates :item_id, presence: true
    validates :name, presence: true

    private

		def reject_musics(attributes)
			attributes['name'].blank? || attributres['song_order'].blank?
		end
end
