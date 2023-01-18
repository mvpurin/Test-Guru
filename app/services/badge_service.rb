class BadgeService

  def initialize(user,test_id)
    @user = user
    @test_id = test_id
    @passed_tests = @user.passed_tests_counter(@user.passed_tests) #current amount of passed tests by user
    @tests_count = @user.passed_tests.uniq.size
    byebug
  end

  def category
    
  end

  def add_badge
    @user.badges.push(Badge.beginner) if @tests_count == 1
    @user.badges.push(Badge.advanced) if @tests_count == Test.all.size / 2
    @user.badges.push(Badge.professional) if @tests_count == Test.all.size

    if @passed_tests[@test_id] == 2
      @user.badges.push(Badge.double)
    end


  end








end
