class CardchargesSettingService
  def initialize(user,order,amount)
    @user = user
    @order = order
    @amount = amount

  end

  def pay!(card_number)

    Stripe.api_key = Settings.stripe_secret_key
 
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => card_number
    )
 
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
  end
end