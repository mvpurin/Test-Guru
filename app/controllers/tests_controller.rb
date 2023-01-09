class TestsController < ApplicationController
  before_action :set_tests, only: :index

  def index
    @tests = Test.ready?
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

end
