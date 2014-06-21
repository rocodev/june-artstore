class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		@current_cart ||= find_cart # @current_cart = @current_cart || find_cart
	end

	def find_cart
		cart = Cart.find_by(id: session[:cart_id])

		# if the cart is not exist, create a new one
		unless cart.present?
			cart = Cart.create
		end
		
		# regist cart id to session
		session[:cart_id] = cart.id
		cart
	end

	def admin_required
		current_user.admin?
	end
	
end
