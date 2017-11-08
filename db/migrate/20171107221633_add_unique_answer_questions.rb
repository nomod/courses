class AddUniqueAnswerQuestions < ActiveRecord::Migration[5.0]
  def change
    add_index :answer_questions, [:question_id, :answer_id, :test_id], unique: true
  end
end
