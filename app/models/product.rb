class Product < ActiveRecord::Base
	belongs_to :creater, :class_name => "User", :foreign_key => :user_id

	def editable_by?(user)
		user && user == creater
	end
end
