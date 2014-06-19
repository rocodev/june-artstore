module AccountHelper

  def render_order_id(order)
    order.id
  end

  def render_order_token(order)
    order.token
  end

  def render_order_total(order)
    order.total
  end

  def render_order_created_at(order)
    order.created_at
  end

end
