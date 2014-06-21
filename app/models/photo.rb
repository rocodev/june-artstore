class Photo < ActiveRecord::Base
	belongs_to :product
  belongs_to :cart
  has_many :cart_items
	mount_uploader :image, ImageUploader
end
