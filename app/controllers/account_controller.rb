class AccountController < ApplicationController

  before_action :authenticate_user!, :only => ['orders']

  def orders
    @orders = current_user.orders
  end

end
