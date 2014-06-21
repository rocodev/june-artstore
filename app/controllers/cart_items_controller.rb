class CartItemsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_item

	def update
		
		if @item.update(cart_item_params)
			flash[:success] = "更新成功！"
		else
			flash[:warning] = "更新失敗！"
		end

		redirect_to :back
	end

	def destroy

		@item.destroy

		flash[:warning] = "刪除成功！"
		redirect_to :back
		
	end

	private

	def find_item
		@item = current_cart.cart_items.find(params[:id])
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end

end
