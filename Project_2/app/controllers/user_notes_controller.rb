class UserNotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = current_user.notes

    @title = "Your notes"

  end

  def show

    @wine = @note.bottle.wine

    @wine_details = "#{@wine.name} #{@wine.vintage}"
    
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
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:appearance, :nose, :palate, :conclusion, :rating, :created_at, :maturity)
    end
end
