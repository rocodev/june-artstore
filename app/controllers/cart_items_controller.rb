class CartItemsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:cart_id])
    
    if @cart.cart_items.find(params[:id]).destroy
      redirect_to(carts_path)
    else
    end
  end

  def update
    
    @cart = Cart.find(params[:cart_id])
    @cart_item = @cart.cart_items.find(params[:id])

    if params[:cart_item]['quantity'].to_i < 1
      flash[:warning] = "數量無法小於0，請確認數量。"
      redirect_to(carts_path)
    else
      if @cart_item.update(cart_item_params)
        redirect_to(carts_path)
      end
    end

  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
