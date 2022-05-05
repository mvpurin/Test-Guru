class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true)}

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  def validate_number_of_answers
    errors.add(:answers_number, 'answers number should be 1..4') if question.answers.count > 4
  end
end
