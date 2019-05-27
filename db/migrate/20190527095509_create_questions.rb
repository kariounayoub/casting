class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :evenement, foreign_key: true
      t.text :contenu

      t.timestamps
    end
  end
end
