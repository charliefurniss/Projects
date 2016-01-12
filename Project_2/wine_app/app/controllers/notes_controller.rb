class NotesController < ApplicationController
	before_action :set_wine, only: [:show]
  def index
  	@notes = Note.all
  end

  def show
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:copy, :rating, :created_at)
    end
end
