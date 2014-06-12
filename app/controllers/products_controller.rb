class ProductsController < ApplicationController

  def index
    @products = Product.order("id DESC")
  end


  def show
  end
end
