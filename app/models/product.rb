class Product < ActiveRecord::Base
	
	has_many :photos

	accepts_nested_attributes_for :photos
	
	#before_save :update_banner_attributes
	def default_photo
    photos.first.image.url
  end

end