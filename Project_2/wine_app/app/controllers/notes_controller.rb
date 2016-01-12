class NotesController < ApplicationController
	before_action :set_note, only: [:show]
  def index
  	@notes = Note.all
  end

  def show
  	#show a single note and its respective wine

  	#get wine

  	@wine = @note.bottle.wine

  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:appearance, :nose, :palate, :conclusion, :rating, :created_at, :maturity)
    end
end
