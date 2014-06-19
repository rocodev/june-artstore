module OrdersHelper
  def render_order_total(order)
    order.total
  end

  def render_order_paid(order)
    if order.paid
      "已付款"
    else
      "未付款"
    end
  end

  def render_order_created_at(order)
    order.created_at
  end

  def render_order_aasm_state(order)
    order.aasm_state
  end
end
