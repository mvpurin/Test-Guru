module TestPassagesHelper

  def score(test_passage)
    test_passage.correct_questions / test_passage.test.questions.count
  end

  def pass_the_test?(test_passage)
    score(test_passage) >= 0.85
  end

end
