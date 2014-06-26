class CreditCardService
  def self.charge(current_user, params)
    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents

    Stripe.api_key = Setting.stripe.api_key

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

    nil
  rescue Stripe::CardError => e
    e.message
  end
end
