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
			flash[:notice] = "You've successfully registered. You are now logged in."
			session[:user_id] = @user.id
			redirect_to root_path
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
		params.require(:user).permit(:username, :password, :timezone)
	end

	def set_user
		@user = User.find_by(slug: params[:id])
	end

	
  def validate_user
    check_login
    if @user != current_user
      flash[:alert] = "Access Denied"
      redirect_to :back
    end
    
    rescue ActionController::RedirectBackError
			redirect_to root_path
  end


end