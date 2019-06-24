class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]
  before_action :vue_translations, only: [:new, :edit]

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
    evenement = Evenement.where(actif: true).first
    inscription.evenement = evenement
    inscription.user = current_user
    authorize inscription
    existing_insc = Inscription.where(user_id: current_user.id, evenement_id: evenement.id)
    if existing_insc.count < 1
      if inscription.save
        inscription_params[:reponses_attributes].each do |r|
          Reponse.create(question_id: r[:question_id], contenu: r[:contenu], inscription_id: inscription.id)
        end
        render json: {success: true}

      else
        render json: {success: false, message: I18n.translate("stepper.newErr")}
      end
    else
      render json: {success: false, message: I18n.translate("stepper.alreadyCreated")}
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
      params.require(:inscription).permit(:id, :photo_candidat, :photo_1, :photo_2, :photo_3, reponses_attributes: [:question_id, :contenu, :id, :inscription_id])
    end

    def vue_translations
      @translations = {
        locale: I18n.locale,
        stepper_title1: I18n.translate("stepper.title1"),
        stepper_title2: I18n.translate("stepper.title2"),
        stepper_title3: I18n.translate("stepper.title3"),
        stepper_title4: I18n.translate("stepper.title4"),
        stepper_title5: I18n.translate("stepper.title5"),
        stepper_photos: I18n.translate("stepper.photos"),
        stepper_profile: I18n.translate("stepper.profile"),
        stepper_add_photo: I18n.translate("stepper.add_photo"),
        photo_sucre: I18n.translate("stepper.photo_sucre"),
        photo_sale: I18n.translate("stepper.photo_sale"),
        photo_autre: I18n.translate("stepper.photo_autre"),
        stepper_previous: I18n.translate("stepper.precedent"),
        stepper_next: I18n.translate("stepper.suivant"),
        stepper_inscription: I18n.translate("stepper.inscription"),
        insc_new: I18n.translate("stepper.new"),
        insc_edit: I18n.translate("stepper.edit"),
        insc_edit_err: I18n.translate("stepper.editErr"),
        insc_incomplete: I18n.translate("stepper.incomplete"),
        sexe_m: I18n.translate("stepper.sexe_m"),
        sexe_f: I18n.translate("stepper.sexe_f"),
      }
    end

end
