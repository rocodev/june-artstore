class Account::OrderController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.order.recent
  end

end
