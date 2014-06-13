class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!

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

	def index
		@products = Product.all
	end

    
	private  #private behind this line 

	def product_params
		params.require(:product).permit(:title, :description, :quanttity)
	end


end
