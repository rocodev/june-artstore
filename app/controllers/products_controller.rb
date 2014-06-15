class ProductsController < ApplicationController

	include ApplicationHelper # To use application helper

	def index
		@products = Product.all
	end
end
