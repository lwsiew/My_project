class AdminController < ApplicationController
	before_action :check_user
	before_action :check_admin
	def index
		@places = Place.all.paginate(:page => params[:page], :per_page =>2)
	end

	def show
		
	end

	def check_user
		if !current_user
		redirect_to root_path, notice: "No trespassing. "
		end
	end

	def check_admin
		if !current_user.admin
		redirect_to root_path, notice: "No trespassing."
		end
	end
end
