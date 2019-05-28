class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = Inscription.all
  end

  def show
  end

  def new
    @inscription = Inscription.new
    evenement = Evenement.where(actif: true)
    @questions = Question.where(evenement: evenement)
  end

  def edit
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.evenement = Evenement.where(actif: true)
    @inscription.user = current_user
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
    end

    def inscription_params
      params.require(:inscription).permit(:user_id, :evenement_id )
    end
end
