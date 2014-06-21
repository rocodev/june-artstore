class Admin::OrdersController < ApplicationController

  def index
    # 可以加個排序進去
    @orders = Order.all
  end  

  def show
      @order =  current_user.orders.find_by_token(params[:id])
   @order_info = @order.info
    @order_items = @order.items
  end 
end
