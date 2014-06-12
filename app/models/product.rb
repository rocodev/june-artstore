class Product < ActiveRecord::Base

  validates :title, presence: :true

  has_many :photos, :dependent => :destroy
  has_one :image, :class_name => "Photo"
  accepts_nested_attributes_for :photos
end
