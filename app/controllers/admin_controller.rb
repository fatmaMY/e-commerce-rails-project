class AdminController < ApplicationController
	  before_action :must_be_admin
	 before_action :logged_in_user
	
	def control_panel
	end
end