module Admin::OrdersHelper
  def render_order_options_for_admin(order)
    render "admin/orders/state_option", order: order
  end
end
