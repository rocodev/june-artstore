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

		# TODO: 加入購物車

		redirect_to :back, :notice => "#{@product.name} 已經加入購物車"
	end
end
