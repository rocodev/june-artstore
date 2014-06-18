class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      if @product.quantity > 0
        current_cart.add_product_to_cart(@product, 1)
        flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
      else
        flash[:notice] = "目前此貨品已售罄，你無法將它加入購物車"
      end
    else
      flash[:warning] = "你的購物車內已有此項商品"
    end
    
    redirect_to :back
  end

end
