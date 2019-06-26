class InscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :reponses do |object|
    responses = object.reponses.includes(:question)
    nom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'nom' }&.contenu
    prenom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'prenom' }&.contenu
    age = get_age(Date.parse(responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'date_naissance' }&.contenu || Date.today.strftime()) )
    sexe = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'sexe' }&.contenu
    ville = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'ville' }&.contenu
    {nom: nom, prenom: prenom, age: age, sexe: sexe, ville: ville}
  end
  attribute :note_personalite do |object|
    object.avg_note_personalite
  end
  attribute :note_cuisine do |object|
    object.avg_note_cuisine
  end
  attribute :percent_complete do |object|
    object.percent_complete
  end

end

def get_age(date)
  age = Date.today.year - date.year
  age -= 1 if Date.today < date + age.years
  age = '' if date == Date.today
  return age
end


