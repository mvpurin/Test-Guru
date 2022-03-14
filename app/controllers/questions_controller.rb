class QuestionsController < ApplicationController
  def index
    #byebug
    @questions = Question.where(:test_id => params[:test_id])
    byebug
  end

  def show
    @question = Question.find(params[:id])
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
end
