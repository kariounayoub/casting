class InscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :reponses do |object|
    responses = object.reponses.includes(:question)
    nom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'nom' }&.contenu
    prenom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'prenom' }&.contenu
    date_naissance = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'date_naissance' }&.contenu
    sexe = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'sexe' }&.contenu
    {nom: nom, prenom: prenom, date_naissance: date_naissance, sexe: sexe}
  end
end
