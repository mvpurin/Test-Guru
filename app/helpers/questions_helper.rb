module QuestionsHelper
  def question_header(question)
    return "Create New <#{Test.find(@question.test_id).title}> Question" if @question.new_record?
    return "Edit <#{Test.find(@question.test_id).title}> Question" if @question.persisted?
  end
end
