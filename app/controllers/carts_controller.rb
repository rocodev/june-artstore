# -*- encoding : utf-8 -*-
class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end
  
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
end
