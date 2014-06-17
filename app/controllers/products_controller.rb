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
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "已成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "購物車內已有此物品"
    end

    redirect_to :back

  end

end
