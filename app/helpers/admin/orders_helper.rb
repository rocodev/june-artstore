module Admin::OrdersHelper

	def show_order_aasm_state(order)
		order.aasm.events
		#這是一個 array  該怎麼變成下拉式選單的選項？
	end

end