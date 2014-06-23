module CartsHelper
  def cart_item_count(cart)
    cart.cart_items.count
  end

  def render_cart_total_price(current_cart)
    current_cart.total_price
  end
end
