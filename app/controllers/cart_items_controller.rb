class CartItemsController < ApplicationController
	def destroy
    @cart_item = CartItem.find_by_product_id(params[:id])
    @cart_item.destroy		

    redirect_to :back
	end
end
