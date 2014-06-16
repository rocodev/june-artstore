class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    # 目前的使用者身份是否為 admin?
    # admin? 在 user.rb 定義
    current_user.admin?
  end

end
