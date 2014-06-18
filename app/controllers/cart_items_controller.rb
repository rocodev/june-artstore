class CartItemsController < ApplicationController

	before_action :authenticate_user!

	def update
		@cart = current_cart
		@item = @cart.cart_items.find(params[:id])

		if @item.update(cart_item_params)
			flash[:success] = "更新成功！"
		else
			flash[:warning] = "更新失敗！"
		end

		redirect_to :back
	end

	def destroy
		@cart = current_cart
		@item = @cart.cart_items.find(params[:id])

		@item.destroy

		flash[:warning] = "刪除成功！"
		redirect_to :back
		
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end

end
