class CartItemController < ApplicationController

  before_action :authenticate_user!
  
  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    redirect_to :back
  end

  def update
    #針對購物車內單一商品去修改數量
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.update(item_params)

    redirect_to carts_path
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end

end
