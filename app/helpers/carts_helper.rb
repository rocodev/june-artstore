module CartsHelper
  def cart_items_count(current_cart)
    current_cart.items.count
  end

  def render_cart_total_price(current_cart)
    current_cart.total_price
  end
end
