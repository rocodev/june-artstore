# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base
	has_many :cart_items, :dependent => :destroy
	has_many :items, :through => :cart_items, :source => :product

	def add_product_to_cart(product, num)
		items << product
		cart_items.last.update_attributes(quantity: num)
	end
	
	def total_price
		items.inject(0) do |sum, item| 
			sum + (item.price * cart_items.find_by_product_id(item.id).quantity)
		end
	end		
end
