class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.recent
  end
end
