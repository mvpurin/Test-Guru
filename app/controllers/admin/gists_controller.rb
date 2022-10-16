class Admin::GistsController < ApplicationController
  before_action :find_gist, only: :show

  def index
    @gists = Gist.all
  end

  def show

  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end

end
