class TestsController < ApplicationController 
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end
end
