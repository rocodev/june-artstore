class Admin::OrdersController < AdminController

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
  
    eval("@order.#{order_params[:aasm_state]}!")

    redirect_to :back
  end

  def order_params
    params.require(:order).permit(:aasm_state)
  end
end
