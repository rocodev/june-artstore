module CartsHelper
	def cart_items_count cart
		cart.cart_items.count
	end
end
