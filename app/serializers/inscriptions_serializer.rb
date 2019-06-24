class InscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :reponses do |object|
    responses = object.reponses.includes(:question)
    nom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'nom' }&.contenu
    prenom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'prenom' }&.contenu
    age = get_age(Date.parse(responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'date_naissance' }&.contenu))
    sexe = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'sexe' }&.contenu
    {nom: nom, prenom: prenom, age: age, sexe: sexe}
  end
  attribute :note_personalite do |object|
    object.notes.map{|n| n.note_personalite}&.sum.to_f / object.notes.map{|n| n.note_personalite}&.size
  end
  attribute :note_cuisine do |object|
    object.notes.map{|n| n.note_cuisine}&.sum.to_f / object.notes.map{|n| n.note_cuisine}&.size
  end

end

def get_age(date)
  unless date == nil
    age = Date.today.year - date.year
    age -= 1 if Date.today < date + age.years
  end
  return age
end
