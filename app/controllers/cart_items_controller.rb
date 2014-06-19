class CartItemsController < ApplicationController

  def update
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])
    @item.update(item_params)

    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])
    @item.destroy
    flash[:notice] = "已經將商品移出購物車"
    redirect_to :back
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end

end
