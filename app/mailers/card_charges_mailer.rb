class CardChargesMailer < ActionMailer::Base
  default from: "staff@artstore.com"
 
  def notify_card_charges_placed(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
 
 
    mail(:to => @user.email , :subject => " [ArtStore] 感謝您完成付款")
  end
end
