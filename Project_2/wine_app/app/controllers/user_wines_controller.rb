class UserWinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  def index
    @wines = current_user.wines
  end

  def show
    
    @wine_details = "#{@wine.name} #{@wine.vintage}"

    @notes = @wine.notes

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_wine
      @wine = current_user.wines(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:producer, :name, :vintage, :alcohol, :region, :country, :grape, :window)
    end
end
