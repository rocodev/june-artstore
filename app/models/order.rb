class Order < ActiveRecord::Base
	belongs_to :creater, :class_name => "User", :foreign_key => :user_id
	has_many :items, :class_name => "OrderItem", :dependent => :destroy
	has_one :info, :class_name => "OrderInfo", :dependent => :destroy

	accepts_nested_attributes_for :info

	before_create :generate_token

	def build_item_cache_from_cart(cart)
		cart.cart_items.each do |cart_item|
			item = items.build
			item.product_name = cart_item.product.name
			item.quantity = cart_item.quantity
			item.price = cart_item.product.price
			item.save
		end
	end

	def calculate_total!(cart)
		self.total = cart.total_price
		self.save
	end

	def generate_token
		self.token = SecureRandom.uuid
	end

	def set_payment_with!(method)
		self.update_column(:payment_method, method)
	end

	def pay!
		self.update_column(:paid, true)
	end

end
