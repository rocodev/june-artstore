class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_orders = current_user.orders.all
  end
end
