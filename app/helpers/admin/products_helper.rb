module Admin::ProductsHelper

	# render product photo
	def render_product_photo_thumb(photo)
		if photo.present?
			image_tag(photo.image.thumb.url, :class => "thumbnail")
		else
			image_tag("http://placehold.it/50x50&text=No+Photo", :class => "thumbnail")
		end
	end

	# render product photo
	def render_product_photo(photo)
		if photo.present?
			image_tag(photo.image.url, :class => "thumbnail")
		else
			image_tag("http://placehold.it/50x50&text=No+Photo", :class => "thumbnail")
		end
	end

	# render product photo grid
	def render_product_photo_grid(photos)
		_result = ""
		photos.each do |photo, index|
			_result = _result + image_tag(photo.image.url, :class => "col-md-3")
		end 

		# print actual HTML string out
		_result.html_safe
	end
end
