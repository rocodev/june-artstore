class ProductsController < ApplicationController

  def index
    @products = Products.order("id DESC")
  end

  def show
    @products = Products.find(params[:id])
  end
end
