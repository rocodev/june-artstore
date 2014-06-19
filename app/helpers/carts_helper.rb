module CartsHelper

  def cart_items_count(cart)
    cart.cart_items.count
  end

  def render_cart_total_price(current_cart)
    current_cart.total_price
  end

  ##

  def render_cart_product_image(cart_product_item)
    if
      image = cart_product_item.product.photos.first.image.url
    else
    end

    image_tag(image)
  end

  def render_cart_product_name(cart_product_item)
    cart_product_item.product.title
  end

  def render_cart_product_price(cart_product_item)
   cart_product_item.product.price
  end

  def render_cart_product_quantity(cart_product_item)
    cart_product_item.quantity.to_i
  end

  def render_cart_product_total_price(cart_product_item)
   cart_product_item.product.price.to_i * cart_product_item.quantity.to_i
  end

end