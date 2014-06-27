class CardChargesController < ApplicationController
 
  before_action :authenticate_user!
 
  def create
 
    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents
    CardChargesService.new(current_user, @order, @amount).charge_card!

    redirect_to order_path(@order.token), :notice => "成功完成付款"
   
    
  end
 
end