module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New <#{Test.find(question.test_id).title}> Question"
    else
      "Edit <#{Test.find(question.test_id).title}> Question"
    end
  end
end
