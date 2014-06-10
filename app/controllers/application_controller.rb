class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #所有人都會繼承，所以可以把萬用方法放在這裡！

  def admin_required
  	current_user.admin? #查詢是否為站長
  end

end
