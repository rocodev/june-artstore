class CardChargesController < ApplicationController

  before_action :authenticate_user!

  def create

    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents
    @card_info = params[:stripeToken]

    ChargesByCardService.new(current_user, @order, @amount, @card_info).charge_by_card!

    redirect_to order_path(@order.token), :notice => "成功完成付款"
    # 寄信
    PaymentMailer.notify_payment_completed(@order).deliver

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render "orders/pay_with_credit_card"
  end

end
