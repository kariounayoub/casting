class EvenementsController < ApplicationController
  before_action :set_evenement, only: [:edit, :update, :destroy]

  def index
    @evenements = Evenement.all
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
        unless evenement == @evenement
          evenement.actif = false
          evenement.save
        end
      end
    end
    if @evenement.save
      redirect_to evenements_path, notice: 'Evenement was successfully created.'
    else
      render :new
    end
  end

  def update
    @evenement.update(evenement_params)
    if @evenement.actif
      Evenement.all.each do |evenement|
        unless evenement == @evenement
          evenement.actif = false
          evenement.save
        end
      end
    end
    if @evenement.update(evenement_params)
      redirect_to evenements_path, notice: 'Evenement was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_evenement
    @evenement = Evenement.find(params[:id])
  end

  def evenement_params
    params.require(:evenement).permit(:nom, :date, :adresse, :actif)
  end
end
