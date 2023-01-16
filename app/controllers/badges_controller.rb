class BadgesController < ApplicationController

  def index
    @badges = current_user.badges
  end

  def show

  end

end
