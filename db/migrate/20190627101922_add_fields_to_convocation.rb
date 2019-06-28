class AddFieldsToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_column :convocations, :venu, :boolean
    add_column :convocations, :note_cuisine, :integer
    add_column :convocations, :note_personalite, :integer
  end
end
