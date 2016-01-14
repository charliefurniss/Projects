class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show

    @wines = Wine.joins(:bottle).where(bottles: { :user_id => 1 })
    
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
