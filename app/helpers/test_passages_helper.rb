module TestPassagesHelper

  def score(test_passage)
    test_passage.correct_questions.to_f / test_passage.test.questions.count.to_f
  end

  def pass_the_test?(test_passage)
    score(test_passage) >= 0.85
  end

  def question_counter(test_passage)
    test_passage.test.questions.ids.index(test_passage.current_question.id) + 1
  end

end
