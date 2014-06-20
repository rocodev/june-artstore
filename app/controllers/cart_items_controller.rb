class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @item = current_cart.cart_items.find(params[:id])
    @item.destroy

    flash[:warning] = "移除成功"
    redirect_to :back
  end


end
