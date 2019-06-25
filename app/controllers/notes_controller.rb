class NotesController < ApplicationController
  before_action :find_inscription, only: [:create, :update]
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.inscription = @inscription
    authorize @note
    if @note.save
      respond_to do |format|
       format.html {redirect_to inscription_path('fr', @inscription), notice: "la note a été validé"}
       format.js
      end
    else
      respond_to do |format|
       format.html {redirect_to inscription_path('fr',@inscription), alert: "la note n'est pas validé"}
       format.js
      end
    end
  end

  def update
    @note = Note.find(params[:id])
    authorize @note
    if @note.update(note_params)
      respond_to do |format|
       format.html {redirect_to inscription_path('fr', @inscription), notice: "la note a été validé"}
       format.js
      end
    else
      respond_to do |format|
       format.html {redirect_to inscription_path('fr',@inscription), alert: "la note n'est pas validé"}
       format.js
      end
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
