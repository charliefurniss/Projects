class UserWinesController < ApplicationController
  before_action :set_wine, only: [:show]
  def index
    @wines = current_user.wines

    @title = "Your wines"

  end

  def show
    
    @notes = Note.where("bottle_id = #{@wine.id}")

    @note = Note.new

    @bottles = @wine.bottles.where("drunk = false")

    @quantity = @bottles.count
  
  end

  def drink_wine

    

  end

  private
    def set_wine
      @wine = current_user.wines.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:producer, :name, :vintage, :alcohol, :region, :country, :grape, :window)
    end
end
