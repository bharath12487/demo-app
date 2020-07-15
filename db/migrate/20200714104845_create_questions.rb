class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :pri, null: false
      t.string :question, null: false
      t.string :teaming_stages
      t.string :appears
      t.integer :frequency
      t.string :question_type
      t.string :condiqtions, null: false
      t.boolean  :required, default: true
      t.references :role, foreign_key: true, null: false, index: true
      t.references :mapping, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
