module Admin::ProductsHelper
  def product_render_photo(product)
    if product.default_photo.present?
      image_tag product.default_photo.image.url, :class => "img-rounded", :alt => product.title
    else
      "No Pic!"
    end
  end
end
