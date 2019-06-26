class CreateConvocations < ActiveRecord::Migration[5.2]
  def change
    create_table :convocations do |t|
      t.references :inscription, foreign_key: true
      t.date :date
      t.time :heure
      t.string :lieu
      t.boolean :mail_envoye

      t.timestamps
    end
  end
end
