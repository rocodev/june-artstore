class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update_attributes(product_params)
    redirect_to admin_products_path
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private  #private behind this line

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :quanttity, :picture)
  end

end
