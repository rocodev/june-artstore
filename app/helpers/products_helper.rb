module ProductsHelper

	def render_product_grid (products)

		@result = " "

		products.each do |product, index|
			@result = @result + render_product_item(product)
		end

		@result.html_safe
	end

	def render_product_item (product)
		item = content_tag(:dev, :class => "col-md-3") do
			content_tag(:div, render_product_photo_medium(product.default_photo)) +
				content_tag(:p,
						content_tag(:strong, product.name) + 
						tag(:br) +
						content_tag(:span, product.price))
		end
	end

end
