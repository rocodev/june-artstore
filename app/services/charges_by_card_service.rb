class ChargesByCardService
  def initialize(user, order, amount, card_info)
    @user = user
    @order = order
    @amount = amount
    @card_info = card_info
  end

  def charge_by_card!
    Stripe.api_key = Settings.stripe.secret_key

    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => @card_info
      )


    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'twd'
    )

    @order.set_payment_with!("credit_card")
    @order.make_payment!
  end

end