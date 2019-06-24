class NotesController < ApplicationController
  before_action :find_inscription, only: [:create, :update]
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.inscription = @inscription
    authorize @note
    if @note.save
      redirect_to inscription_path('fr',@inscription)
    else
      redirect_to inscription_path('fr',@inscription)
    end
  end

  private

  def note_params
      params.require(:note).permit(:id, :note_cuisine, :note_personalite)
  end

  def find_inscription
    @inscription = Inscription.find(params[:inscription_id])
  end
end
