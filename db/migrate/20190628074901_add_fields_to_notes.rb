class AddFieldsToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :convocation, foreign_key: true
    remove_column :convocations, :note_cuisine, :boolean
    remove_column :convocations, :note_personalite, :boolean
  end
end
