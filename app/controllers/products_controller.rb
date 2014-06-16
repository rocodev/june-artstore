class ProductsController < ApplicationController

  def index
    # 依 ID 降冪排序（最新的產品在最上面）
    @products = Product.order("id DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

end
