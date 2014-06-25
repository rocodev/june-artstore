class OrderMailer < ActionMailer::Base
    default from: "staff@artstore.com"

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info

    mail(:to => @user.email, :subject => "[artstore] 感謝您完成本次下單，以下為本次購物明細： #{order.token}")
    
  end

end
