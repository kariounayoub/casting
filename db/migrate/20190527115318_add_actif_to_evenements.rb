class AddActifToEvenements < ActiveRecord::Migration[5.2]
  def change
    add_column :evenements, :actif, :boolean
  end
end
