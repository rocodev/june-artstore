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
end
