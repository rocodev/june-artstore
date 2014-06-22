class Admin::OrdersController < AdminController

  def index
    @orders = Order.all
  end

end
