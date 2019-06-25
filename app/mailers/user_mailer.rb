class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    @display_name = @user.prenom.nil? ? @user.email + " (please edit your profile and tell us your name)" : @user.prenom
    mail(to: @user.email, subject: "Bienvenue dans l'aventure MasterChef Junior")
  end

  def inscription
    @inscription = params[:inscription]
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


    @display_name = @user.prenom.nil? && @prenom.nil? ? @user.email + " (please edit your profile and tell us your name)" : "#{@nom} #{@prenom}"
    if @mail_tuteur == nil
      @tuteur = false
      mail(to: @user.email, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    else
      @display_name_tuteur = @prenom_tuteur == "" ? @mail_tuteur + " (please complete the inscription and tell us your name)" : @prenom_tuteur + " " + @nom_tuteur
      @tuteur = true
      mail(to: @user.email, cc: @mail_tuteur, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    end
  end
end
