class CardChargesService
  def initialize(user,order,amount,params)
    @user = user
    @order = order
    @amount = amount
    @params = params
  end

  def charge_card!
    Stripe.api_key = Settings.stripe.test_secret_key
 
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => @params
      )
 
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 
    OrderMailer.notify_order_paid_by_credit(@order).deliver

  end
end