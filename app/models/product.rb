# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  quantity    :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  price       :float            default(0.0)
#

class Product < ActiveRecord::Base

  validates :title , :presence => true
  validates :quantity , :presence => true
end
