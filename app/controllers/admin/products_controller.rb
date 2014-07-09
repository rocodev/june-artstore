class Admin::ProductsController < ApplicationController

	#the order is important, you should confirm current_user is exit brfore called admin_required
	before_action :authenticate_user!
	before_action :admin_required, :except => [:index]
	before_action :find_product, :only => [:show, :edit, :update, :destroy]


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

	def edit
	end

	def update
		if @product.create
			redirect_to admin_products_path
		else
			render :edit
		end

	end

	def destroy
		if @product.destroy
			redirect_to aadmin_products_path
		end
	end



	private

	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :quantity)
	end


end
