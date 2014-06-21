class Account::OrdersController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@orders = current_user.orders
	end

	def cancel
		@order = Order.find(params[:id])

		if @order.process_state == "order_placed" || @order.process_state == "paid"
			@order.cancel_order!
			@order.save

			flash[:success] = "已將此訂單取消"
		else
			flash[:success] = "目前狀態無法取消"
		end

		redirect_to :back
	end

	def return
		@order = Order.find(params[:id])

		if @order.process_state == "shipped"
			@order.return_good!
			@order.save

			flash[:success] = "已經退貨"
		else
			flash[:success] = "目前狀態無法退貨"
		end

		redirect_to :back
	end
end
