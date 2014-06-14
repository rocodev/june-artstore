class Product < ActiveRecord::Base
	
	has_many :photos
	accepts_nested_attributes_for :photos
	
	#before_save :update_banner_attributes

	def update_banner_attributes
    if image.present? && image_changed?
      self.image = image.file.filename
    end
  end

end