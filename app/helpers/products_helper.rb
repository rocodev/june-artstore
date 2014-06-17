module ProductsHelper

  def render_product_photo(product)
    if product.default_photo.present?
      image_url = product.default_photo
    else
      image_url = "http://placehold.it/350x150"
    end
    image_tag(image_url)
  end

  def render_product_name(product)
    product.title
  end

  def render_product_description(product)
    product.description
  end

  def render_product_price(product)
    product.price
  end

  def render_product_quantity(product)
    product.quantity
  end

end
