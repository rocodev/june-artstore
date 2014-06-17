class ApplicationController < ActionController::Base

  #自己打造一個helper_method
  helper_method :current_cart
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #所有人都會繼承，所以可以把萬用方法放在這裡！

  def admin_required
  	current_user.admin? #查詢是否為站長
  end

  def current_cart
    
    @current_cart ||= find_cart

  end

  def find_cart
    
    cart = Cart.find_by(id: session[:cart_id])

    unless cart.present?
      cart = Cart.create #建造一個cart
    end

    session[:cart_id] = cart.id

    cart

  end



end
