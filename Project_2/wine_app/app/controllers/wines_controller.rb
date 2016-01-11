class WinesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  def index
    @wines = Wine.all
  end

  def show
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
      @wine = Wine.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:producer, :name, :vintage, :region, :country, :grape, :maturity)
    end
end
