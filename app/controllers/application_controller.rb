class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    # 目前的使用者身份是否為 admin?
    # admin? 在 user.rb 定義
    current_user.admin?
  end

  # 宣告 current_cart 是一個 controller 級的 helper
  helper_method :current_cart

  def current_cart
    # @current_cart = cuttent_cart or find_cart
    # ?
    @current_cart ||= find_cart
  end

  def find_cart

    cart = Cart.find_by(id: session[:cart_id])

    unless  cart.present?
      # 如果 session 內沒有 cart 就生一個
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    # return cart to current_cart
    cart
  end

end
