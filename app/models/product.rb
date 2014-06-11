class ImageUploader < CarrierWave::Uploader::Base

  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "imageupload/"
  end

end
class Product < ActiveRecord::Base
	
	has_many :photos
	
	mount_uploader :image, ImageUploader
	
	before_save :update_banner_attributes

	validates :image, presence: true

	def update_banner_attributes
    if image.present? && image_changed?
      self.image = image.file.filename
    end
  end

end