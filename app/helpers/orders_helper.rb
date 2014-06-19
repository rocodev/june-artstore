module OrdersHelper

  def render_cart_item_title_for_order(cart_product_item_for_order)
    cart_product_item_for_order.product_name
  end

  def find_cart_item_product_id_for_order(cart_product_item_for_order)
    cart_product_item_for_order.product
  end

  def render_cart_item_price_for_order(cart_product_item_for_order)
    cart_product_item_for_order.price
  end

  def render_cart_item_quantity_for_order(cart_product_item_for_order)
    cart_product_item_for_order.quantity
  end

  def render_cart_item_total_price_for_order(cart_product_item_for_order)
    cart_product_item_for_order.price.to_i * cart_product_item_for_order.quantity.to_i
  end

end
