class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  def index

    @wines = Wine.all

    @title = "CellarBook wines"

  end

  def show
    
    @wine_details = "#{@wine.name} #{@wine.vintage}"

    @notes = @wine.notes

  end

  def new

    @wine = Wine.new

  end

  def create

    if !logged_in?

      redirect_to root_path

    end

    @wine = Wine.new(wine_params)

    if @wine.save

      quantity = bottle_params[:quantity].to_i

      quantity.times do |i|

        @bottle = Bottle.create(wine: @wine , user: current_user)
            
      end

      redirect_to action: @users_wine

    else
      # shows the user the completed form again
      render "new"

    end
    
  end

  private
    def set_wine
      @wine = Wine.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:producer, :name, :vintage, :alcohol, :region, :country, :grape, :window)
    end

    def bottle_params
      params.require(:bottle).permit(:vendor, :price, :quantity)
    end
end
