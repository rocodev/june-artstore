class CartItemsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:cart_id])
    
    if @cart.cart_items.find(params[:id]).destroy
      redirect_to(carts_path)
    else
    end
  end
end
