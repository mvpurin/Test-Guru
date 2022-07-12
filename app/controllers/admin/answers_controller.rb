class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: [:new, :create]

  def index
    
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
  end

  def destroy
    @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).require(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

end