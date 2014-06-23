class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      @order.build_item_cache_from_cart(current_cart)
      @order.caculate_total!(current_cart)
      # 確認結賬、訂單產生後後清空購物車
      current_cart.clear
      # 產生 token 保密訂單網址
      redirect_to order_path(@order.token)
    else
      # 跨 controller
      render "carts/checkout"
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
    # @order.pay!
    # 在 aasm 設定中 make payment 提交後會執行 pay! 的內容所以這邊不用寫了

    # ⬇️
    @order.make_payment!

    redirect_to account_orders_path, :notice => "成功完成付款"
  end

  private

  def order_params
    params.require(:order).permit(:info_attributes => [:billing_name, :billing_address, :shipping_name, :shipping_address])
  end

end
