class Admin::ProductsController < ApplicationController

	#app/controller/admin/products_controller.rb
	require 'carrierwave/orm/activerecord'

	before_action :authenticate_user!
	before_action :admin_required

	def admin_required
		current_user.admin?
	end	

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
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end	


	def destroy
		@product = Product.find(params[:id])
		@product.destroy 
  		redirect_to admin_products_path, notice: "The product
  			 #{@product.title} has been deleted."
	end	

	private 

	def product_params
	  params.require(:product).permit(:title, :description, :quantity)
	end  


end
