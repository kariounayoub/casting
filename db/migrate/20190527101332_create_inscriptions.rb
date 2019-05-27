class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.references :user, foreign_key: true
      t.references :evenement, foreign_key: true
      t.text :q1
      t.text :r1
      t.text :q2
      t.text :r2
      t.text :q3
      t.text :r3
      t.text :q4
      t.text :r4
      t.text :q5
      t.text :r5
      t.text :q6
      t.text :r6
      t.text :q7
      t.text :r7
      t.text :q8
      t.text :r8
      t.text :q9
      t.text :r9
      t.text :q10
      t.text :r10

      t.timestamps
    end
  end
end
