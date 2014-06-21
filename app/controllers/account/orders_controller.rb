class Account::OrdersController < ApplicationController
  def index
    @user_orders = current_user.orders.all
  end
end
