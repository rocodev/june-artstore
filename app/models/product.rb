class Product < ActiveRecord::Base

  validates :title, :presence => true
  mount_uploader :photo, PhotoUploader
end
