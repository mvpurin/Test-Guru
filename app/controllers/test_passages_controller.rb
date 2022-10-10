class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    byebug
    @test_passage.user.gists.create(question_gist: result.to_json, url: result.url, user_id: current_user.id, question_id: @test_passage.current_question_id)

    flash_options = if GistQuestionService.client.last_response.status == 201
      { notice: t('test_passages.gist.success', url: GistQuestionService.client.last_response.data.url).html_safe }
    else
      { alert: t('test_passages.gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
