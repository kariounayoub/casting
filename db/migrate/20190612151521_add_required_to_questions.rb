class AddRequiredToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :required, :boolean
  end
end
