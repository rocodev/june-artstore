class Product < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
end
