# -*- encoding : utf-8 -*-
class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def destroy
  end

  def clear_cart
    current_cart.items.destroy_all

    render :index
  end
 
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
end
