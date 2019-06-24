class InscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :reponses do |object|
    array = object.reponses.includes(:question).map do |r|
      if r.question.categorie == 'personnel' && (r.question.contenu == 'nom' || r.question.contenu == 'prenom' || r.question.contenu == 'date_naissance' || r.question.contenu == 'sexe')
        {categorie: r.question.categorie, question: r.question.contenu, reponse: r.contenu}
      end
    end
    array.compact
  end
end
