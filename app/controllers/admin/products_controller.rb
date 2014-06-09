class Admin::ProductsController < ApplicationController

	def index
		@products = Product.all
	end	


 	def new 
 		@product = Product.new
 	end 

 	def create
 		@product = Product.new(product_parmas)
 		if @product.save 
 			redirect_to product_path(@product)
 		else
 			render :new	
 		end 


 	end 



 	def show
 	end


 private 

 	def product_parmas 
 		params.require(:product).permit(:title, :description, :quantity)

 	end 


end
