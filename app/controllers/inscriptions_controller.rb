class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = Inscription.all
  end

  def show
  end

  def new
    @inscription = Inscription.new
    @questions = Question.where(evenement: @evenement)
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
      params.require(:inscription).permit(:user_id, :evenement_id, :q1, :r1, :q2, :r2, :q3, :r3, :q4, :r4, :q5, :r5, :q6, :r6, :q7, :r7, :q8, :r8, :q9, :r9, :q10, :r10)
    end
end
