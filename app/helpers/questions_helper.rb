module QuestionsHelper
  def question_header(test)
    if !params[:test_id].nil?
      if current_page?(new_test_question_path)
        p "Create New <#{test.title}> Question"
      end
    elsif current_page?(edit_question_path)
      p "Edit <#{Test.find(@question.test_id).title}> Question"
    end
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
