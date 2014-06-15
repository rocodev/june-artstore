class Admin::ProductsController < ApplicationController

	before_action :authenticate_user!
	before_action :admin_required

	# Using the main layout of admin
	layout 'admin/main'
	
	# Index of Admin::product
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@photo = @product.photos.new
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
		@photos = @product.photos
	end

	def edit
		@product = current_user.products.find(params[:id])
	end

	def update
		@product = current_user.products.find(params[:id])

		if @product.update(product_params)
			redirect_to admin_products_path(@product)
		else
			render :edit
		end

	end

	def destroy
		@product = current_user.products.find(params[:id])
		@product.destroy

		redirect_to admin_products_path

	end

	private

	def product_params
		# photos_attributes is created by attribute writer
		params.require(:product).permit(:name, :description, :quantity, :price, :photos_attributes => [:image])
	end
end
