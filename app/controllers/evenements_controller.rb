class EvenementsController < ApplicationController
  before_action :set_evenement, only: [:edit, :update, :activate, :destroy]

  def index
    @evenements = policy_scope(Evenement).order(created_at: :desc)
  end

  def new
    @evenement = Evenement.new
    authorize @evenement
  end

  def edit
  end

  def create
    @evenement = Evenement.new(evenement_params)
    authorize @evenement
    if @evenement.actif
      Evenement.all.each do |evenement|
        unless evenement == @evenement
          evenement.actif = false
          evenement.save
        end
      end
    end
    if @evenement.save
      redirect_to evenements_path, notice: 'Evenement créé avec succès.'
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
      redirect_to evenements_path, notice: 'Evenement mis à jour avec succès.'
    else
      render :edit
    end
  end

  def activate
    @evenement.actif = true
    @evenement.save
    Evenement.all.each do |evenement|
      unless evenement == @evenement
        evenement.actif = false
        evenement.save
      end
    end
    redirect_to evenements_path, notice: 'Evenement activé.'
  end

  def destroy
    @evenement.destroy
    redirect_to evenements_url, notice: 'Evenement supprimé avec succès.'
  end

  private

  def set_evenement
    @evenement = Evenement.find(params[:id])
    authorize @evenement
  end

  def evenement_params
    params.require(:evenement).permit(:nom, :date, :adresse, :actif)
  end
end
