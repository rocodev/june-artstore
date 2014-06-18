class CartsController < ApplicationController

  before_action :authenticate_user!, :only => ['checkout', 'clear_cart']
  
  def index
    @cart_items = current_cart.cart_items
    #@order = current_user.orders.build
    #@info = @order.build_info
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def item_clear
    current_cart.clear_cart_item
    redirect_to(products_path)
  end

  #def show
  #end


end
