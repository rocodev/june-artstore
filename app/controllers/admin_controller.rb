class AdminController < ApplicationController

	before_action :authenticate_user!
	before_action :admin_required

	# Using the main layout of admin
	layout 'admin/main'

	def index

	end

end
