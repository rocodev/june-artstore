class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :title, :presence => true
  validates :image, :presence => true

end
