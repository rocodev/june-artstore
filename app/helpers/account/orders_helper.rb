module Account::OrdersHelper
  def render_account_order_total(order)
    order.total
  end

  def render_account_order_paid(order)
    if order.paid
      "已付款"
    else
      "未付款"
    end
  end

  def render_account_order_created_at(order)
    order.created_at
  end
end
