class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@photo = Photo.find_by(:product_id => @product.id)
	end
end
