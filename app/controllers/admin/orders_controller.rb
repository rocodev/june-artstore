class Admin::OrdersController < ApplicationController
  before_filter :find_order, :except => [:index]

  def index
    @orders = Order.all
  end
  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  def change_status_to_shipping
    @order.ship!
    redirect_to :back, :notice => "變更狀態為已出貨"
  end


  def change_status_to_order_cancelled
    @order.order_cancelled!
    redirect_to :back, :notice => "訂單已取消"
  end

  def change_status_to_good_returned
    @order.good_returned!
  end

  protected


  def find_order
    @order =  Order.find_by_token(params[:id])
  end

end
