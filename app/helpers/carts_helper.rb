module CartsHelper
  def cart_items_count (cart)
    cart.cart_items.count
  end

  def render_cart_total_price(current_cart)
    current_cart.total_price
  end

  def render_empty_cart_button(cart)
    if cart_items_count(cart) > 0 
      link_to("清空購物車", empty_carts_path, :method => :post, :class => "btn btn-primary btn-lg btn-danger pull-left")       
    end
  end
end
