module Admin::ProductsHelper
  def products_render_image
    if @product.photos.first != nil
      image_tag @product.photos.first.image.url, :class => "img-rounded"
    else
      "No Pic"
    end
  end
end
