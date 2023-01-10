class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: [:new, :create, :index]
  before_action :find_answer, only: :destroy

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
    if @answer.save
      redirect_to admin_question_answers_path(@question)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_answers_path(@answer.question_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

end
