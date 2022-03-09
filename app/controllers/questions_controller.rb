class QuestionsController < ApplicationController
  def index
    #byebug
    @tests = Test.find(params[:id])
  end
end
