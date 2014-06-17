class ProductsController < ApplicationController

	include ApplicationHelper # To use application helper

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		@product = Product.find(params[:id])

		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product, 1)
			flash[:notice] = "你已經成功把 #{@product.name} 加入購物車"
		else
			flash[:warning] = "你的購物車內已經有此物品"
		end

		redirect_to :back, :notice => "#{@product.name} 已經加入購物車"
	end
end
