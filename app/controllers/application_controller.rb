class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prenom, :nom, :adresse, :ville, :date_de_naissance, :sexe, :taille, :taille_vetement, :pointure, :nationalite_residence, :allergie_intolerance, :allergie_intolerance_contenu, :medicament, :medicament_contenu, :autre])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:prenom, :nom, :adresse, :ville, :date_de_naissance, :sexe, :taille, :taille_vetement, :pointure, :nationalite_residence, :allergie_intolerance, :allergie_intolerance_contenu, :medicament, :medicament_contenu, :autre])
  end
end
