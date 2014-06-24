class Admin::OrdersController < AdminController



  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by_token(params[:id])

    @order_info = @order.info
    @order_items = @order.items
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
