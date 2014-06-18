class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    # 建立一個人的訂單
    # 
    @order = current_user.orders.build
    @info = @order.build_info
  end

end
