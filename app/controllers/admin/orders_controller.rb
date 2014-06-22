class Admin::OrdersController < ApplicationController
  before_action :authenticate_user! # Devise Helper
  before_action :admin_required

  def index
    @orders = Order.recent
  end
end
