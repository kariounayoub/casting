class AddCasterToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :caster, :boolean
  end
end
