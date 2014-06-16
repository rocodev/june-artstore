class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required


  def new
    @product = Product.new
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

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if params[:product][:photos_attributes] && params[:product][:photos_attributes].length > 0
      @product.photos.clear
    end

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, :flash => { :notice => "deleted" }
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :photos_attributes => [:image])
  end

end
