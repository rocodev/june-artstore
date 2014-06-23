class ProductsController < ApplicationController

  def index
    @products = Product.order("id DESC")
  end


  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
 
    @product = Product.find(params[:id])
 
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product, params[:num])
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "你的購物車內已有此物品"
    end
 
    # Back to the page that issued the request.
    # 回到目前所在頁面
    redirect_to :back
 
  end  

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end
end
