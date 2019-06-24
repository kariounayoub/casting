class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :inscription, foreign_key: true
      t.integer :note_cuisine
      t.integer :note_personalite
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
