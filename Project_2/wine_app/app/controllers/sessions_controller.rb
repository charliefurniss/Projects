class SessionsController < ApplicationController
  def new
  end

  def create
  	# user has sent email and password

  	# see if the user/email exists (using the email submitted in the form in new view)

  	user = User.find_by_email(params[:email])

  	# .authenticate encrypts the password sent from the form and checks the encrypted hash against the database returning true or false depending on whether it exists
  	if user && user.authenticate(params[:password])

  		#session stores data for the duration of the session: the symbol is user_id and the value is user.id
  		session[:user_id] = user.id

  		#this tells you that you have logged in successfully, not that you are already logged in
  		redirect_to user_wines_path, notice: "logged in"

  	else

  		render "new"

  	end

  end

  def destroy
  	#unset the session id (ie, log out) and redirect
  	session[:user_id] = nil
  	redirect_to "/sessions/new"
  end
end
