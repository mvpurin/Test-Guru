class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render html: @test.questions.map {|question| question.body}
  end

  def show
    render html: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Good"
    else
      render plain: "Bad"
    end
  end

  def destroy
    @question.destroy
    puts "Question was not deleted" if @question.exists?
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

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
