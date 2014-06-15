class Product < ActiveRecord::Base

	has_many :photos

  validates :title , :presence => true
  validates :quantity , :presence => true

  accepts_nested_attributes_for :photos

  def default_photo
    photos.first
  end

end
