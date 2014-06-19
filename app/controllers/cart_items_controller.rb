class CartItemsController < ApplicationController

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])
    @item.destroy
    flash[:notice] = "已經將商品移出購物車"
    redirect_to :back
  end

end
