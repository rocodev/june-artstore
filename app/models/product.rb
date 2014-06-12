class Product < ActiveRecord::Base

	mount_uploader :product_img, ProductImgUploader
#	has_many :product_imgs


end
