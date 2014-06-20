class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @item = current_cart.cart_items.find(params[:id])
    @item.destroy

    flash[:warning] = "移除成功"
    redirect_to :back
  end

  def update
    @item = current_cart.cart_items.find(params[:id])
    @item.update(item_params)
    
    redirect_to carts_path
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end


end
