class Product < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos #, reject_if: proc { |attributes| attributes["image"].blank? }

  validates :title,    presence: true
  validates :quantity, presence: true
  validates :price,    presence: true

  def main_photo
    photos.first
  end
end
