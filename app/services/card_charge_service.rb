class CardChargeService
  def initialize(order, user, stripeToken)
    @order = order
    @user = user
    @stripeToken = stripeToken

    @amount = @order.total * 100 # in cents
  end

  def charge_card!
    # Stripe.api_key = 'sk_test_6wWptHVBceNrlYCKC41ytWJi'
    Stripe.api_key = Settings.stripe.api_key
 
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => @stripeToken
    )
 
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 
  end
end