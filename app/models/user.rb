class User < ApplicationRecord
	has_secure_password
	has_many :reviews
	has_many :bookmarks

	mount_uploader :profile_pic, ProfilePicUploader

	validates_uniqueness_of :email, :username


end
