class CartsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end


  def destroy
    @carts = current_cart 
    if @carts.destroy
      session[:cart_id] =nil 
      flash[:notice] = "成功移除購物車所有商品"
    else
      flash[:warning] =" Something Wrong"
    end
    redirect_to :root

  end

  
end
