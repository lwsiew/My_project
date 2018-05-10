class Place < ApplicationRecord
	has_many :reviews
	has_many :bookmarks

	mount_uploader :image, ImageUploader

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	def self.search(search)
	  where("name ilike ? OR description ilike ?", "%#{search}%", "%#{search}%")
	end
	
end
