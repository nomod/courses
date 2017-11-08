class Test < ApplicationRecord

  has_and_belongs_to_many :users
  has_and_belongs_to_many :answer_questions

end