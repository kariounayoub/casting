class EvenementsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :nom,  :adresse, :date
  attribute :questions do |object, params|
    object.questions.map do |q|
      response = object.reponses.find_by_question_id_and_inscription_id(q.id,params[:inscription])
      {
        id: q.id,
        categorie: q.categorie,
        contenu: (response ? response.contenu : nil),
        r_id: (response ? response.id : nil) ,
        text: I18n.translate("question.#{q.categorie}.#{q.contenu}"),
        categorie_text: I18n.translate("inscription.cat.#{q.categorie}."),
        type: q.data_type
      }
    end
  end
end
