class User < ApplicationRecord
	has_secure_password

	mount_uploader :profile_pic, ProfilePicUploader

	validates_uniqueness_of :email, :username


end
