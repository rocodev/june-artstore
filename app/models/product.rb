class Product < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  validates :title, :presence => true
  validates :quantity, :presence => true
  validates :price, :presence => true

  def default_photo
    photos.first
  end
end
