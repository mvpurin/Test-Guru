class Admin::TestsController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_test, only: :destroy
  
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = current_user.created_tests.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save!
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def edit

  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end


  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
