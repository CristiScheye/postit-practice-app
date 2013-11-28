class UsersController < ApplicationController
	before_action :check_login, except: [:new, :create]
	before_action :set_user, except: [:new, :create]
	before_action :validate_user, only: [:edit, :update]

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "You've successfully registered"
			redirect_to login_path
		else
			render :new
		end

	end

	def edit
	end

	def update

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

	def set_user
		@user = User.find(params[:id])
	end

	def validate_user

		if !logged_in?
			flash[:notice] = "Please log in to see profile"
			redirect_to login_path
		end

		if @user != current_user
			flash[:alert] = "Access Denied"
			redirect_to root_path
		end
	end
end