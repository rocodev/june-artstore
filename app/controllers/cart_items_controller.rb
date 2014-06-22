class CartItemsController < ApplicationController

  def create
    @cart_item = current_cart.cart_items.build(cart_item_params)

    if !current_cart.items.include?(@cart_item.product)
      add_product_to_cart
    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back
  end

  def update
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)

    redirect_to carts_path
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    if @cart_item.present?
      @cart_item.destroy
      flash[:notice] = "你已成功將 #{@cart_item.product.title} 移除"
    else
      flash[:warning] = "你的購物車沒有此物品"
    end

    redirect_to carts_path
  end

  private
  def add_product_to_cart


    if @cart_item.save
      flash[:notice] = "你已成功將 #{@cart_item.product.title} 加入購物車"
    else
      flash[:warning] = "你輸入的數量不正確"
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
