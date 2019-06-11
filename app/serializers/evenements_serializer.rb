class EvenementsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :nom,  :adresse, :date
  attribute :questions do |object|
    object.questions.map do |q|
      {id: q.id, categorie: q.categorie, reponse: object.reponses.find_by_question_id(q.id), text: I18n.translate("question.#{q.categorie}.#{q.contenu}"), type: q.data_type}
    end
  end
end
