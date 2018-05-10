class SessionController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      if !user.admin
  		redirect_to root_path, flash: {notice: "Signed in"}
      else
      redirect_to admin_index_path
      end
  	else
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path, flash: {notice: "Signed out"}
  end

end