class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	#if I have a current_user value return that, otherwise find one
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]

  end	

  def logged_in?
  	#!! = true or false, so this function tells us whether or not we're logged in
  	!!current_user
  	
  end

  def authenticate
  	#checks if user logged in and redirects to another page
  	unless logged_in?
  		redirect_to "/sessions/new"
  	end	
  end

end
