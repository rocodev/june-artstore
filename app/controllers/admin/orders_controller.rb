class Admin::OrdersController < ApplicationController
  before_filter :find_order, :except => [:index]

  def index
    @orders = Order.all
  end
  def show
    @order_info = @order.info
    @order_items = @order.items
  end



  def change_state_to_order_cancelled
    @order.cancell_order!
    redirect_to :back, :notice => "訂單已取消"
  end

  def change_state_to_good_returned
    @order.return_good!
  end

  protected


  def find_order
    @order =  Order.find_by_token(params[:id])
  end

end
