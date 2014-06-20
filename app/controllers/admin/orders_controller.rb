class Admin::OrdersController < ApplicationController

  def index
    # TODO Pagenavi
    @orders = Order.all.limit(10)
  end

  def change_state
    @order = Order.find_by_token(params[:id])
    case @order.aasm_state
    when "ship"
      @orders.ship!
      redirect_to :back
    when "deliver"
      @orders.deliver!
      redirect_to :back
    when "cancel"
      @orders.cancel_order!
      redirect_to :back
    when "return"
      @orders.return_good!
      redirect_to :back
    end
  end

end
