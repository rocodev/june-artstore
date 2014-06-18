module CartItemsHelper
	def quntity_available_array (product)
		(1..product.quantity).to_a
	end
end
