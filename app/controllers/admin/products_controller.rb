class Admin::ProductsController < ApplicationController
	#before_action => 限定加入動作
	before_action :authenticate_user! #確保已經正確登入
	before_action :admin_required #自己添加的function

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		@product.save

		@image = @product.photos.build(image_params)
		#@image.image = File.open('public/imageupload')
		@image.save
		render plain: @image.inspect
	end

	def show
		@product = Product.find(params[:id])
		@photo = Photo.find_by(:product_id => @product.id)
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price)
	end

	def image_params
		params.require(:product).permit(:image)
	end

end
