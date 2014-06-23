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
      if @product.quantity > 0
        current_cart.add_product_to_cart(@product,1)
        flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
      else
        flash[:warning] = "此物品已經銷售完畢了，無法加入購物車"
      end
      
    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back

  end

  def delete_from_cart

    @product = Product.find(params[:id])

    if current_cart.items.include?(@product)
      current_cart.delete_item_from_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 從購物車中移除"
    else
      flash[:warning] = "你的購物車內已無此物品"
    end

    redirect_to :back

  end


end
