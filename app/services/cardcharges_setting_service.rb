class CardchargesSettingService
  def initialize(user,order,amount)
    @user = user
    @order = order
    @amount = amount

  end

  def pay!

    Stripe.api_key = 'sk_test_hlkxcfM6uYxGzLbsEtpncc3o'
 
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => params[:stripeToken]
      )
 
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
  end
end