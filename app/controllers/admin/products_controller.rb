class Admin::ProductsController < ApplicationController

	# 在所有的controller action 動作之前，都必須要先做檢查驗證user 的動作
	before_action :authenticate_user!
	# 在所有的 action 動作之前，都要檢查是不是 admin  
	before_action :admin_required 

	def index
		@products = Product.all
	end	


 	def new 
 		@product = Product.new
 	end 

 	def create
 		@product = Product.new(product_parmas)
 		if @product.save 
 			redirect_to admin_product_path(@product)
 		else
 			render :new	
 		end 

 	end 

 	def show

 		@product = Product.find(params[:id])

 	end

 	def edit
 	

 	end 

 	def update
 	

 	end 




 private 

 	def product_parmas 
 		params.require(:product).permit(:title, :description, :quantity)
 	end 


end
