class CartsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end


  def destroy

  	# 為什麼不能用  @items = current_cart.itmes  , 然後清空 items 的資料就好? 

    @cart = current_cart
    if @cart.destroy
      session[:cart_id] =nil 
      flash[:notice] = "成功移除購物車所有商品"
    else
      flash[:warning] =" Something Wrong"
    end
    redirect_to :root

  end


  
end
