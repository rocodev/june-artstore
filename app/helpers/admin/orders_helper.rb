module Admin::OrdersHelper
  def render_state_transition_btn(label, order, event)
    link_to(label, state_transition_admin_order_path(order, event: event), method: :post, :class => "btn btn-primary")
  end
end
