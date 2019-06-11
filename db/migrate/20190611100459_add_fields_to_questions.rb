class AddFieldsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :data_type, :string
  end
end
