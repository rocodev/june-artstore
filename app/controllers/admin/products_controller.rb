class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_url(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
