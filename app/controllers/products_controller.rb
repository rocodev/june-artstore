class ProductsController < ApplicationController

  def index
    @q = Product.search(params[:q])
    if !params[:q].blank?
      @products = @q.result(distinct: true)
    else
      @products = Product.order("id DESC")
    end
  end


  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    #選擇某樣商品
    #如果尚未加入
    #則加入購物車

    #顯示訊息
    #返回
    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      if @product.quantity > 0
        current_cart.add_product_to_cart(@product,1)
        flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
      else
        flash[:warning] = "此物品已停止銷售，你無法將它加入購物車"
      end

    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back
  end 
end
