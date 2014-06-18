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
			if @product.quantity > 0
				current_cart.add_product_to_cart(@product, 1)
				flash[:notice] = "你已經成功把 #{@product.name} 加入購物車"
			else
				flash[:warning] = "此物品已經完售，我們將盡快補貨"
			end
		else
				flash[:warning] = "您的購物車已經有此項物品"
		end

		redirect_to :back
	end
end
