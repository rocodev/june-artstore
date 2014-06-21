class OrderMailer < ActionMailer::Base
  default from: "staff@artstore.com"

  def notify_order_placed(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info



    mail(:to => @user.email , :subject => " [ArtStore] 感謝您完成本次的下單，以下是您這次購物明細 #{order.token}")
  end


  def notify_pay_by_credit_card_sucess(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
 	@order_token = order.token

    mail(:to => @user.email , :subject => " [ArtStore] 訂單編號 #{order.token} 信用卡扣款成功 ")
  end





end
