class TestsController < ApplicationController

  def index
    @tests = Test.where(ready: 1)
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

end
