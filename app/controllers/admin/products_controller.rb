class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create

    @product = Product.new(product_params)

    if @product.save

      # single upload
      # if params[:product][:photo]
      #   @product.photos.create(image: params[:product][:photo])
      # end

      if params[:product][:photos_attributes]

        @photos_attrs = params[:product][:photos_attributes]
        @photos_attrs.each do |photo_attr|
          # check destroy status and photo is exist
          if photo_attr[1][:_destroy] == 'false' && photo_attr[1][:photo] != nil
            @product.photos.create(image: photo_attr[1][:photo])
          end
        end
      end

      redirect_to admin_products_path

    else
      render :new
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, tasks_attributes: [:id, :name, :_destroy])
  end

end
