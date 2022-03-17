class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    find_test
    render html: @result.questions.map {|question| question.body}
  end

  def show
    @question = Question.find(params[:id])
    render html: @question.body
  end

  def new
  end

  def create
    quest = Question.create(question_params)
  end

  def destroy
    Question.find(params[:id]).destroy!
  end

  private
  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @result = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
