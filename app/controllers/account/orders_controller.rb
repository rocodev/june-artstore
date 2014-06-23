# -*- encoding : utf-8 -*-
class Account::OrdersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders.recent
  end

  def destroy 
    @order = current_user.orders.find(params[:id])

    @order.destroy
  end
end
