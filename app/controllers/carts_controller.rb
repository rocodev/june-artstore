class CartsController < ApplicationController

  # 必須登入才能結賬
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

end
