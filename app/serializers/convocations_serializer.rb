class ConvocationsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :venu

  attribute :date do |object|
    object.date.strftime('%d/%m/%y')
  end

  attribute :heure do |object|
    object.heure.strftime('%R')
  end

  attribute :inscription do |object|
    responses = object.inscription.reponses.includes(:question)
    nom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'nom' }&.contenu
    prenom = responses.find { |r| r.question.categorie == 'personnel' && r.question.contenu == 'prenom' }&.contenu
    {id: object.inscription.id, nom: nom, prenom: prenom}
  end

  attribute :note_cuisine do |object|
    object.avg_note_cuisine
  end

  attribute :note_personalite do |object|
    object.avg_note_personalite
  end

  attribute :ma_note_cuisine do |object, params|
    object.notes.find_by_user_id(params[:current_user].id)&.note_cuisine
  end

  attribute :ma_note_personalite do |object, params|
    object.notes.find_by_user_id(params[:current_user].id)&.note_personalite
  end

  attribute :new_note do |object, params|
    object.notes.find_by_user_id(params[:current_user].id).blank?
  end

  attribute :note_id do |object, params|
    object.notes.find_by_user_id(params[:current_user].id)&.id
  end
end
