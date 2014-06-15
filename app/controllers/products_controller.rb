class ProductsController < ApplicationController

	def index
		Product.all
	end
end
