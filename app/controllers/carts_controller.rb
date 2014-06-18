class CartsController < ApplicationController

  before_action :authenticate_user!, :only => ['checkout']
  
  def index
    @cart_items = current_cart.cart_items
    #@order = current_user.orders.build
    #@info = @order.build_info
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clear_cart
    
  end

  #def show
  #end


end
