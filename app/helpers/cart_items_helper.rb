module CartItemsHelper
	def quantity_available_array (product)
		(1..product.quantity).to_a
	end
end
