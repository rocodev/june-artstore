class Admin::ProductsController < ApplicationController

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

    def index
    @product = Product.all
    end

    private

    def product_params
	params.requires(:product).permit(:title, :description, :quantity)
    end
end
