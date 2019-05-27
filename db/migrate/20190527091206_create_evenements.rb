class CreateEvenements < ActiveRecord::Migration[5.2]
  def change
    create_table :evenements do |t|
      t.string :nom
      t.date :date
      t.string :adresse

      t.timestamps
    end
  end
end
