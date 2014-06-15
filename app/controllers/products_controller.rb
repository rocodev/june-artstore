class ProductsController < ApplicationController
	def index
		# product list
		@products = Product.order("id DESC")
	end

	def show
		# product info
		@product = Product.find(params[:id])
	end
end
