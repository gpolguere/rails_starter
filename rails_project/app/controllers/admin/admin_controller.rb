class Admin::AdminController < ApplicationController
	before_filter :check_if_admin
	layout "admin/layouts/application"

	def index
	end

	private
	def check_if_admin
		unless current_user && current_user.is_at_least?("admin")
			redirect_to new_user_session_path, :notice => "You don't have the admin rights"
		end
	end


end