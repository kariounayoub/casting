class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    @first_name = @user.prenom.nil?
    @display_name = @first_name ? @user.email : @user.prenom
    mail(to: @user.email, subject: "Bienvenue dans l'aventure MasterChef Junior")
  end

  def inscription
    @inscription = params[:inscription]
    reponses
    if @mail_tuteur == nil
      @greeting = "#{@display_name_tuteur}, #{@display_name}"
      mail(to: @user.email, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    else
      @display_name_tuteur = @prenom_tuteur == "" ? @mail_tuteur : @prenom_tuteur + " " + @nom_tuteur
      @greeting = @display_name
      mail(to: @user.email, cc: @mail_tuteur, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    end
  end

  def convocation
    @convocation = params[:convocation]
    @inscription = @convocation.inscription
    reponses
    if @mail_tuteur == nil
      @greeting = "#{@display_name_tuteur}, #{@display_name}"
      mail(to: @user.email, subject: "Convocation pour le casting MasterChef Junior !")
    else
      @display_name_tuteur = @prenom_tuteur == "" ? @mail_tuteur : @prenom_tuteur + " " + @nom_tuteur
      @greeting = @display_name
      mail(to: @user.email, cc: @mail_tuteur, subject: "Convocation pour le casting MasterChef Junior !")
    end
  end

  def reponses
    @user = @inscription.user
    evenement = Evenement.first
    question_mail = Question.where(evenement_id: evenement.id, categorie: "tuteur", contenu: "email").first.id
    question_prenom_tuteur = Question.where(evenement_id: evenement.id, categorie: "tuteur", contenu: "prenom").first.id
    question_nom_tuteur = Question.where(evenement_id: evenement.id, categorie: "tuteur", contenu: "nom").first.id
    question_nom = Question.where(evenement_id: evenement.id, categorie: "personnel", contenu: "nom").first.id
    question_prenom = Question.where(evenement_id: evenement.id, categorie: "personnel", contenu: "prenom").first.id

    @mail_tuteur = @inscription.reponses.where(question_id: question_mail.to_i).first&.contenu&.strip
    @prenom_tuteur = @inscription.reponses.where(question_id: question_prenom_tuteur.to_i).first&.contenu&.strip
    @nom_tuteur = @inscription.reponses.where(question_id: question_nom_tuteur.to_i).first&.contenu&.strip
    @nom = @inscription.reponses.where(question_id: question_nom.to_i).first&.contenu&.strip
    @prenom = @inscription.reponses.where(question_id: question_prenom.to_i).first&.contenu&.strip

    @first_name = @user.prenom.nil?

    @display_name = @user.prenom.nil? && @prenom.nil? ? @user.email : "#{@nom} #{@prenom}"
  end
end
