class ProductsController < ApplicationController

  def index
    # 依 ID 降冪排序（最新的產品在最上面）
    @products = Product.order("id DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart

    @product = Product.find(params[:id])

    # 如果商品不存在購物車
    #（current_cart 要在 applicationController 自己造）用 helper_method :current_cart
    # 這樣就能在這裡 (controller) 和 view 使用 current_cart 了
    if !current_cart.items.include?(@product)

      # 把商品加到購物車 (cart model)
      # def add_product_to_cart(product)
      #   items << product
      # end

      # 更新 add_product_to_cart method 新增數量，所以這邊預設將 1 個商品加入購物車
      current_cart.add_product_to_cart(@product, 1)
      flash[:notice] = "已成功將 #{@product.title} 加入購物車"
    else
      # 再加一個商品到購物車
      current_cart.add_onemore_product_to_cart(@product, 1)
      flash[:notice] = "已增加一件 #{@product.title} 進您的購物車"
    end

    redirect_to :back

  end

end
