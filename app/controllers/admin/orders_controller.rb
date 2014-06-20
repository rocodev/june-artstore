class Admin::OrdersController < ApplicationController

  def index
    # TODO Pagenavi
    @orders = Order.all.limit(10)
  end

  def change_state_to(state)
    case state
    when "ship"
      @orders.ship!
    when "deliver"
      @orders.deliver!
    when "cancel"
      @orders.cancel_order!
    when "return"
      @orders.return_good!
    end
  end

end
