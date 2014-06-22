class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def update
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.update(item_params)

    redirect_to carts_path, notice: "已更新購買數量"
  end

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    redirect_to :back, alert: "成功清空物品"
  end

  private

  def item_params
    params.require(:item).permit(:quantity)
  end
end
