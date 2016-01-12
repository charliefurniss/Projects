class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new

    if logged_in?

      redirect_to root_path

    end

    @user = User.new
  
  end

  def create

    if logged_in?

      redirect_to root_path

    end

    @user = User.new(user_params)

    if @user.save

      redirect_to action: 'index'

    else
      # shows the user the completed form again
      render "new"

    end
    
  end

  private

  def user_params

    params.require(:user).permit(:email, :password, :password_confirmation)

  end 

end
