class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :lang, :contact, :a_propos]

  def home
  end

  def lang
    I18n.locale = params[:lang].to_sym
    redirect_to root_path(I18n.locale)
  end

  def dashboard
    @inscriptions = InscriptionsSerializer.new(Inscription.all).serialized_json
    authorize current_user
  end

  def casting
    @convocations = ConvocationsSerializer.new(Convocation.all, {params: {current_user: current_user}}).serialized_json
    authorize current_user
  end
  def contact
  end

  def a_propos
  end
end
