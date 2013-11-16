class UsersController < ApplicationController

	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new

		if @user.save
			flash[:notice] = "You've successfully registered"
			redirect_to root_path
		else
			render :new
		end

	end

	def edit
	end

	def update
	end

	def destroy
	end

end