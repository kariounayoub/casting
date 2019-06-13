class AddPhotoToInscription < ActiveRecord::Migration[5.2]
  def change
    add_column :inscriptions, :photo_candidat, :string
  end
end
