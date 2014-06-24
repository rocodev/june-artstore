class PaymentMailer < ActionMailer::Base
  default from: "service@artstore.com"

  def notify_payment_completed(order)
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info

    mail(:to => @user.email, :subject => "[ArtStore] 感謝您的購買，您的訂單已經完成信用卡結賬手續，我們將盡快為您進行出貨 #{order.token}")
  end

end
