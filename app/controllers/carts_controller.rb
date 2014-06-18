class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def empty
    current_cart.empty_cart (current_cart)
    redirect_to root_path, :notice => "已清空購物車"
  end

  def delete_product_from
    current_cart.delete_product_from_cart params[:id]
    redirect_to root_path, :notice => "已清空商品"
  end
end
