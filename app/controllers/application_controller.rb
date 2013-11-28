class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def current_user
  	@current_user =  User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
  	!!session[:user_id]
  end

  def check_login
  	current_user

  	if !logged_in?
  		flash[:notice] = "Sorry, you must be logged in to do that."
  		redirect_to login_path
  	end
  end

  helper_method :logged_in?

end
