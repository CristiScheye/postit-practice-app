class UsersController < ApplicationController
	before_action :check_login, except: [:new, :create]

	def show
		if !logged_in?
			flash[:notice] = "Please log in to see your profile"
			redirect_to login_path
		end

		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "You've successfully registered"
			redirect_to root_path
		else
			render :new
		end

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:notice] = "Your info was successfully updated"
			redirect_to root_path
		else
			render :edit
		end
	end


	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

end