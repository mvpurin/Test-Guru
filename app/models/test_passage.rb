class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_next_question, on: [:create, :update]

  MINIMUM_MARK = 0.85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids) && !time_is_finish?
      self.correct_questions += 1
    end

    save!
  end

  def score
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def pass_the_test?
    score >= MINIMUM_MARK && !time_is_finish?
  end

  def question_counter
    test.questions.ids.index(current_question.id) + 1
  end

  def timer_test_time_finish
    created_at + test.timer.minutes
  end

  def time_is_finish?
    test.timer? && timer_test_time_finish.past?
  end

  private

  def before_validation_set_first_next_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    (correct_answers_count == answer_ids.count)
  end

  def correct_answers
    current_question.answers.correct
  end
end
