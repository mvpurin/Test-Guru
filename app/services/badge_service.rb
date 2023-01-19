class BadgeService

  def initialize(user,test_id)
    @user = user
    @test_id = test_id
    @test = Test.find(@test_id)
    @category = Category.find(@test.category_id)
    @passed_tests = @user.passed_tests_counter(@user.passed_tests) #current amount of passed tests by user
    @tests_count = @user.passed_tests.uniq.size
  end

  def current_category
    arr = []
    @passed_tests.each_key {|key| arr << key if @passed_tests[key] == 1}
    @category.tests.ids - arr
  end

  def current_level
    arr = []
    @passed_tests.each_key {|key| arr << key if @passed_tests[key] == 1}
    Test.where(level: @test.level).ids - arr
  end

  def add_badge
    @user.badges.push(Badge.beginner) if @tests_count == 1
    @user.badges.push(Badge.advanced) if @tests_count == Test.all.size / 2
    @user.badges.push(Badge.professional) if @tests_count == Test.all.size

    if @passed_tests[@test_id] == 2
      @user.badges.push(Badge.double)
    end

    if @passed_tests[@test_id] == 1
      @user.badges.push(Badge.first_try)
    end

    if current_category.empty?
      @user.badges.push(Badge.category)
    end

    if current_level.empty?
      @user.badges.push(Badge.level)
    end
  end

end
