class Admin::OrdersController < ApplicationController

	before_action :authenticate_user!
	before_action :admin_required

	# Using the main layout of admin
	layout 'admin/main'

	def index
		@orders = Order.all
	end

	def shipping
		@order = Order.find(params[:id])

		if @order.process_state == "paid"
			@order.ship!
			@order.save
			flash[:success] = "已將此訂單設定為出貨狀態"
		elsif @order.process_state == "shipping"
			flash[:warning] = "此訂單已經出貨"
		elsif  @order.process_state == "order_placed"
			flash[:warning] = "此訂單還沒結帳不能出貨"

		end
		
		redirect_to :back
	end

	def shipped
		@order = Order.find(params[:id])

		if @order.process_state == "shipping"
			@order.deliver!
			@order.save
			flash[:success] = "已將此訂單設定為已到貨狀態"
		elsif @order.process_state == "shipped"
			flash[:warning] = "此訂單已經是已到貨狀態"
		elsif  @order.process_state == "order_placed"
			flash[:warning] = "此訂單還沒結帳"

		end
		redirect_to :back
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
