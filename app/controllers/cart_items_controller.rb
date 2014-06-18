class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    flash[:warning] = "Delete Successfully!"
    redirect_to :back
  end

private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end


end
