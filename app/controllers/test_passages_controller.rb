class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if (@test_passage.completed? && !@test_passage.time_is_finish?) || @test_passage.time_is_finish?
      if @test_passage.pass_the_test?
        @test_passage.update(passed: true)
        BadgeService.new(@test_passage).add_badge
      end

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @gist_question_service = GistQuestionService.new(@test_passage.current_question)
    result = @gist_question_service.call

     if @gist_question_service.success?
       @test_passage.user.gists.create(question_info: result.to_json, url: result.url, user_id: current_user.id, question_id: @test_passage.current_question_id)
       flash.notice = t('test_passages.gist.success', url: @gist_question_service.client.last_response.data.url).html_safe
     else
       flash.alert = t('test_passages.gist.failure')
     end
     redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
