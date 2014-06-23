class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user! # Devise Helper
  before_action :admin_required

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
      redirect_to admin_products_url, notice: "建立成功"
    else
      flash.now[:alert] = "驗證失敗"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_url(@product.id), notice: "更新成功"
    else
      flash.now[:alert] = "驗證失敗"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).
      permit(:title, :description, :quantity, :price, photos_attributes: [:image])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
