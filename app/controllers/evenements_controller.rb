class EvenementsController < ApplicationController
  before_action :set_evenement, only: [:show, :edit, :update, :destroy]

  def index
    @evenements = Evenement.all
  end

  def show
  end

  def new
    @evenement = Evenement.new
  end

  def edit
  end

  def create
    @evenement = Evenement.new(evenement_params)
    if @evenement.actif
      Evenement.all.each do |evenement|
        evenement.actif = false unless evenement == @evenement
      end
    end
    if @evenement.save
      redirect_to @evenement, notice: 'Evenement was successfully created.'
    else
      render :new
    end
  end

  def update
    if @evenement.actif
      Evenement.all.each do |evenement|
        evenement.actif = false unless evenement == @evenement
      end
    end
    if @evenement.update(evenement_params)
      redirect_to @evenement, notice: 'Evenement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evenement.destroy
      redirect_to evenements_url, notice: 'Evenement was successfully destroyed.'
  end

  private

  def set_evenement
    @evenement = Evenement.find(params[:id])
  end

  def evenement_params
    params.require(:evenement).permit(:nom, :date, :adresse)
  end
end
