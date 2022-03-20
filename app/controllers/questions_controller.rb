class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index, new, create]
  before_action :find_question, only: %i[show, destroy]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    find_test
    render html: @test.questions.map {|question| question.body}
  end

  def show
    find_question
    render html: @question.body
  end

  def new
    find_test
  end

  def create
    byebug
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Good"
    else
      render plain: "Bad"
    end
  end

  def destroy
    question = find_question
    question.destroy

    puts "Question was not deleted" if question.exists?
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  # def rescue_with_question_not_found
  #   render plain: 'Question not found'
  # end
end
