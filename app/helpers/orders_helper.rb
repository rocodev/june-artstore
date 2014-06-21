module OrdersHelper
  def render_order_link(order)
    link_to(order.token, order_path(order.token))
  end  

  def render_order_user_name(order)
    User.find(order.user_id).email
  end  

  def render_order_created_time(order)
    order.created_at
  end  

  def render_order_state(order)
    order.aasm_state
  end  

  def render_order_link(order)
    link_to(order.token, order_path(order.token))
  end  

  
end
