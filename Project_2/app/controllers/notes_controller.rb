class NotesController < ApplicationController
	before_action :set_note, only: [:show]
  def index
  	@notes = Note.all

    @title = "CellarBook notes"

  end

  def show
  	
    @wine = @note.bottle.wine

  end


  def new

    @star = '<i class="fa fa-star">'

    @note = Note.new

  end


  def create
    
    @note = Note.create(note_params)
  
  end  

  def wine_note_new

    bottles = Bottle.where(:wine_id => params[:id] , :user => current_user, :drunk => false)

    bottle = bottles.first

    bottle.drunk = true

    bottle.save

    bottle.notes.create(note_params)

    redirect_to "/user_wines/#{params[:id]}"

  end



  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:appearance, :nose, :palate, :conclusion, :rating, :created_at, :maturity)
    end
end
