class Order < ActiveRecord::Base
	belongs_to :creater, :class_name => "User", :foreign_key => :user_id
	has_many :items, :class_name => "OrderItem", :dependent => :destroy
	has_one :info, :class_name => "OrderInfo", :dependent => :destroy

	accepts_nested_attributes_for :info

	def build_item_cache_from_cart(cart)
		cart.items.each do |cart_item|
			item = item.build
			item.product_name = cart_item.name
			item.quantity = cart_item.quantity
			item.price = cart_item.price
			item.save
		end
	end

end
