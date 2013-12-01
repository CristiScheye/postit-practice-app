class SessionsController < ApplicationController

	def new
	end

	def create

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've successfully logged in"
      redirect_to root_path
    else
      flash[:alert] = "There's something wrong with your login information"
      render :new
    end

	end

	def destroy
		session[:user_id] = nil
    flash[:notice] = "You've successfully logged out"
    redirect_to root_path
	end
end