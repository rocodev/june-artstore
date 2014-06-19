class CartItemController < ApplicationController

  before_action :authenticate_user!
  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    redirect_to :back
  end

end
