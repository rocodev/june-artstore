class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.build(quantity: 1)
  end

  def del_from_cart
    @product = Product.find(params[:id])
    if current_cart.items.include?(@product)
      current_cart.del_product_from_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 移除"
    else
      flash[:warning] = "你的購物車沒有此物品"
    end

    redirect_to carts_path
  end

end
