# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  quantity    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base

  validates :title , :presence => true
end
