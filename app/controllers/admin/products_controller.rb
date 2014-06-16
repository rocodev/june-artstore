class Admin::ProductsController < ApplicationController

  # 使用者必須先登入
  before_action :authenticate_user!

  # 使用者的身份必須是 admin
  # admin_required 在 applicationController 裡定義
  before_action :admin_required

  def new
    @product = Product.new
    # ???
    @photo = @product.photos.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def index
    @products = Product.all
  end

  private

  def product_params
                                                                  # :nested_attributes => [:關聯 Model 的欄位]
    params.require(:product).permit(:title, :description, :quantity, :price, :photos_attributes => [:image])
  end

end
