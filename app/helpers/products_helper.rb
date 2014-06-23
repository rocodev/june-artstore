module ProductsHelper
  def product_render_photo(product, size = "thumb")
    if product.default_photo.present?
      image_url = product.default_photo.image.send(size).url
    else
      image_url = "http://placehold.it/200x200&text=No Pic"
    end

    image_tag image_url, :class => "img-rounded", :alt => product.title
  end
end
