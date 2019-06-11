class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = policy_scope(Inscription).order(created_at: :asc)
  end

  def show
  end

  def new
    authorize Inscription.new
    @evenement = EvenementsSerializer.new(Evenement.first).serialized_json
  end

  def edit
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.evenement = Evenement.where(actif: true).first
    @inscription.user = current_user
    @inscription.save
    authorize @inscription
    if @inscription.save
      redirect_to root_path(I18n.locale), notice: 'Inscription was successfully created.'
    else
      render :new
    end
  end

  def update
    if @inscription.update(inscription_params)
      redirect_to inscription_path(I18n.locale, @inscription), notice: 'Inscription was successfully updated.'
    else
      render :edit
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
      params.require(:inscription).permit(:user_id, :evenement_id, :photo_1, :photo_2, :photo_3, reponses_attributes: [:contenu, :question_id])
    end
end
