class Product < ActiveRecord::Base

  validates :title, presence: :true

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos

  def default_photo
    photos.first
  end

end
