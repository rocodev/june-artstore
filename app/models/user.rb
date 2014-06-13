class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # ? => boolean function ; ! => 
  def admin?
  	is_admin
  end	

  # def pay!(amount)  => change property/status 
  #   self 
  #
  # end

  # if@product.save! => using exception handler for debug 
end
