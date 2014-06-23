class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      @order.build_item_cache_from_cart(current_cart)
      @order.calculate_total!(current_cart)
      
      # @cart_items = CartItem.find_by_cart_id(current_cart.id)
      #redirect_to root_path
      redirect_to order_path(@order.token)
      current_cart.cart_items.each do |cart_item|
        cart_item.destroy
      end

    else
      render "carts/index"
    end
  end
   
  def show
    @order = current_user.orders.find_by_token(params[:id])
    @order_info = @order.info
    @order_items = @order.items
  end

  def pay_with_credit_card
    @order = current_user.orders.find_by_token(params[:id])
    @order.set_payment_with!("credit_card")
    #@order.pay!
    @order.make_payment!

    # current_cart.cart_items.each do |cart_item|
    #   cart_item.destroy
    # end

    # redirect_to root_path, :notice => "成功完成付款"
    redirect_to orders_path, :notice => "成功完成付款"
  end
  private

  def order_params
    params.require(:order).permit(:info_attributes => [:billing_name, :billing_address,:shipping_name, :shipping_address] )
  end

end
