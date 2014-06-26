class CardChargesController < ApplicationController

  before_action :authenticate_user!

  def create

    error = CreditCardService.charge(current_user, params)
    @order = current_user.orders.find_by_token(params[:order_id])
    if error
      flash[:error] = error
      render "orders/pay_with_credit_card"
    else
      @order.set_payment_with!("credit_card")
      @order.make_payment!
      OrderMailer.notify_card_paid(@order).deliver

      redirect_to order_path(@order.token), :notice => "成功完成付款"
    end
  end
end
