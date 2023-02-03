class BadgesController < ApplicationController

  def index
    if params[:user_id].nil?
      @badges = Badge.all
    else
      @badges = current_user.badges
    end
  end

  def show

  end

end
