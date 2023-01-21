class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def edit

  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def new
    @badge = current_user.created_badges.new
  end

  def create
    @badge = current_user.created_badges.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :body, :picture, :rule, :params)
  end

end
