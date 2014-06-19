class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_order, except: [:index]

  def show

    @order_info = @order.info
    @order_items = @order.items
  end

  def index
    @orders = Order.all
  end

  def ship
    @order.ship
    save_and_redirect_to_show
  end

  def deliver
    @order.deliver
    save_and_redirect_to_show
  end

  def cancel_order
    @order.cancel_order
    save_and_redirect_to_show
  end

  def return_good
    @order.return_good
    save_and_redirect_to_show
  end

  private
  def find_order
    @order = Order.find(params[:id])
  end

  def save_and_redirect_to_show
    @order.save
    redirect_to admin_order_path(@order)
  end
end
