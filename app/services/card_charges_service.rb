class CardChargesService
  def initialize(user,order,amount)
    @user = user
    @order = order
    @amount = amount
  end

  def charge_card!
    Stripe.api_key = Settings.stripe.test_secret_key
 
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
      )
 
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 
 
    
 
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render "orders/pay_with_credit_card"
  end
end