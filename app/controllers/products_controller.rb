class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.find(params[:id])
  end
end
