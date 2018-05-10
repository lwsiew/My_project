class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(allowed_params)
		if @user.save
		    session[:user_id] = @user.id
		    redirect_to root_path
		else
		    render "new"
		end
	end

	def edit
		@user = current_user
	end

	def update
		current_user.update(allowed_params)
		current_user.save
		redirect_to user_path(current_user.id)
	end

	private

	def allowed_params
		params.require(:user).permit(:username, :email, :password, :profile_pic)
	end
end
