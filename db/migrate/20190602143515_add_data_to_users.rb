class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :adresse, :string
    add_column :users, :ville, :string
    add_column :users, :date_de_naissance, :date
    add_column :users, :sexe, :string
    add_column :users, :taille, :integer
    add_column :users, :taille_vetement, :string
    add_column :users, :pointure, :integer
    add_column :users, :nationalite_residence, :boolean
    add_column :users, :allergie_intolerance, :boolean
    add_column :users, :allergie_intolerance_contenu, :text
    add_column :users, :medicament, :boolean
    add_column :users, :medicament_contenu, :text
    add_column :users, :autre, :text
  end
end
