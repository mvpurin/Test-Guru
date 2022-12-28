class TestsController < ApplicationController
  before_action :set_tests, only: :index

  def index
    @tests = test_not_empty?
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_not_empty?
    @tests.select {|test| test.questions.size > 0}
  end

end
