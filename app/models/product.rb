class Product < ActiveRecord::Base
	# Tells rails to use this uploader for this model.
	#mount_uploader :picture, PictureUploader 
	has_many :photos

end
