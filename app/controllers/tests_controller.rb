class TestsController < ApplicationController
  before_action :set_test, only: %i[start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_user
    @user = User.first
  end
end
