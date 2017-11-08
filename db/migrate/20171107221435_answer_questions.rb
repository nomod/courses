class AnswerQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_questions do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :test_id

      t.timestamps
    end
  end
end
