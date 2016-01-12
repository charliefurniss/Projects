class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  def index
    @wines = Wine.all
    # @link = "wine"
  end

  def show
    
    @wine_details = "#{@wine.name} #{@wine.vintage}"

    @notes = @wine.notes

  end

  private
    def set_wine
      @wine = Wine.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:producer, :name, :vintage, :alcohol, :region, :country, :grape, :window)
    end
end
