class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> {where(correct: true).pluck(:body)}

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  def validate_number_of_answers
    errors.add(:answers_number, 'answers number shouls be 1..4') unless question.answers.count < 4
  end
end
