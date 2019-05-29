class CreateReponses < ActiveRecord::Migration[5.2]
  def change
    create_table :reponses do |t|
      t.references :inscription, foreign_key: true
      t.references :question, foreign_key: true
      t.text :contenu

      t.timestamps
    end
  end
end
