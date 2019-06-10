class AddPhotoToInscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :inscriptions, :photo_1, :string
    add_column :inscriptions, :photo_2, :string
    add_column :inscriptions, :photo_3, :string
  end
end
