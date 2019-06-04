class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  def index
    @questions = policy_scope(Inscription).order(created_at: :asc)
  end

  def show
  end

  def new
    @inscription = Inscription.new
    authorize @inscription
    evenement = Evenement.where(actif: true)
    @questions = Question.where(evenement: evenement)
    @questions.each do |question|
      @inscription.reponses.build(question_id: question.id)
    end
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
      redirect_to @inscription, notice: 'Inscription was successfully created.'
    else
      render :new
    end
  end

  def update
    if @inscription.update(inscription_params)
      redirect_to @inscription, notice: 'Inscription was successfully updated.'
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
      params.require(:inscription).permit(:user_id, :evenement_id, reponses_attributes: [:contenu, :question_id])
    end
end
