class CardChargesController < ApplicationController

  before_action :authenticate_user!
 
  def create
 
    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents
   
    CardchargesSettingService.new(current_user,@order,@amount).pay!
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 

    CardChargesMailer.notify_card_charges_placed(@order).deliver
 
    redirect_to order_path(@order.token), :notice => "成功完成付款"
 

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render "orders/pay_with_credit_card"
  end

end
