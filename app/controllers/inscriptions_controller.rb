class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = policy_scope(Inscription).order(created_at: :asc)
  end

  def show
  end

  def new
    @inscription = Inscription.new
    authorize @inscription
    @evenement = EvenementsSerializer.new(Evenement.where(actif: true).first, {params: {inscription: @inscription.id}}).serialized_json
  end

  def edit
    @evenement = EvenementsSerializer.new(Evenement.where(actif: true).first, {params: {inscription: @inscription.id}}).serialized_json
  end

  def create
    inscription = Inscription.new(inscription_params)
    inscription.evenement = Evenement.where(actif: true).first
    inscription.user = current_user
    authorize inscription
    if inscription.save
      inscription_params[:reponses_attributes].each do |r|
        Reponse.create(question_id: r[:question_id], contenu: r[:contenu], inscription_id: inscription.id)
      end
      render json: {success: true}

    else
      render json: {success: false}
    end
  end

  def update
    if @inscription.update(inscription_params)
      inscription_params[:reponses_attributes].each do |r|
          Reponse.find_by_id(r[:id]).update(question_id: r[:question_id], contenu: r[:contenu], inscription_id: @inscription.id)
        end
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  def destroy
    @inscription.destroy
    redirect_to inscriptions_url, notice: 'Inscription was successfully destroyed.'
  end

  private
    def set_inscription
      @inscription = Inscription.find(params[:id])
      authorize @inscription
    end

    def inscription_params
      params.require(:inscription).permit(:id, :photo_1, :photo_2, :photo_3, reponses_attributes: [:question_id, :contenu, :id, :inscription_id])
    end

end
