class Admin::ProductsController < ApplicationController

	# 在所有的controller action 動作之前，都必須要先做檢查驗證user 的動作 , devise 的 method
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
 		@sales_ticket = SalesTicket.new

 	end

 	def edit
 	    @product = Product.find(params[:id])


 	end 

 	def update
 		 @product = Product.find(params[:id])
 		 if @product.update_attributes(product_parmas)
 		 	# saysomething good 
 		 	redirect_to admin_products_path
 		 else
 		 	render 'edit'
 		 end 


 	end

 	def buy
		@sales_ticket = Sales_ticket.new(sales_ticket_params)
		if @sales_ticket.save
			redirect_to admin_products_path(@product)
		else
			render	:show
		end

 	end 



 private 

 	def product_parmas 
 		params.require(:product).permit(:title, :description, :quantity, :product_img)
 	end 


 	def sales_ticket_parmas
 		params.require(:sales_ticket).permit(:quantity, :buyer_id, :payment_type)
 	end

end
