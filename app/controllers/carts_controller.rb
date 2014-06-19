class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def destroy
    @cart = current_cart
    @cart.destroy

    session[:card_id] = nil

    flash[:notice] = "你已成功清空購物車"
    redirect_to products_path
  end

end
