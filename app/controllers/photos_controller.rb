class PhotosController < ApplicationController
  def new
    @product = Product.find(params[:product_id]) 
    @photo = @product.photos.new 
  end  
  def create
  	@product = Product.find(params[:product_id])
  	@product.photos.create(photos_params)
  	redirect_to admin_product_path(@product)
  end

  def destroy
  	@product = Product.find(params[:product_id])
  	@photo = @product.photos.find(params[:id])
  	@photo.destroy
  end
  
  private 
    def photos_params
      params.require(:photo).permit(:image_name, :image)	
    end
end

