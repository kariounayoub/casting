class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    @display_name = @user.prenom.nil? ? @user.email + " (please edit your profile and tell us your name)" : @user.prenom
    mail(to: @user.email, subject: "Bienvenue dans l'aventure MasterChef Junior")
  end

  def inscription
    @inscription = params[:inscription]
    @user = @inscription.user
    @display_name = @user.prenom.nil? ? @user.email + " (please edit your profile and tell us your name)" : @user.prenom

    question_mail = Question.where(evenement_id: 1, categorie: "tuteur", contenu: "email").first.id
    question_prenom_tuteur = Question.where(evenement_id: 1, categorie: "tuteur", contenu: "prenom").first.id
    question_nom_tuteur = Question.where(evenement_id: 1, categorie: "tuteur", contenu: "nom").first.id

##### TEST OK, DEV PROBLEM !!!!!!

    @mail_tuteur = @inscription.reponses.where(question_id: question_mail.to_i).first.nil? ? "" : @inscription.reponses.where(question_id: question_mail.to_i).first.contenu.strip
    @prenom_tuteur = @inscription.reponses.where(question_id: question_prenom_tuteur.to_i).first.nil? ? "" : @inscription.reponses.where(question_id: question_prenom_tuteur.to_i).first.contenu.strip
    @nom_tuteur = @inscription.reponses.where(question_id: question_nom_tuteur.to_i).first.nil? ? "" : @inscription.reponses.where(question_id: question_nom_tuteur.to_i).first.contenu.strip
    if @mail_tuteur == ""
      @tuteur = false
      mail(to: @user.email, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    else
      @display_name_tuteur = @prenom_tuteur == "" ? @mail_tuteur + " (please complete the inscription and tell us your name)" : @prenom_tuteur + " " + @nom_tuteur
      @tuteur = true
      mail(to: @user.email, cc: @mail_tuteur, subject: "Ton inscription a bien été prise en compte pour participer à MasterChef Junior !")
    end
  end
end
