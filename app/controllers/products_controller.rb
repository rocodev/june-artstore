class ProductsController < ApplicationController

  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.build(quantity: 1)
  end

end
