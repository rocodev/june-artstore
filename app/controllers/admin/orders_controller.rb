class Admin::OrdersController < ApplicationController

  def index
    # TODO Pagenavi
    @orders = Order.all.limit(10)
  end

end
