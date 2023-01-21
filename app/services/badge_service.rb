class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = User.find(@test_passage.user_id)
    @test = Test.find(@test_passage.test_id)
    @category = Category.find(@test.category_id)
    @passed_tests = @user.passed_tests_counter #current amount of passed tests by user
  end

  def current_category
    @category.tests.ids - TestPassage.where(user_id: @user.id, test_id: @category.tests.ids, passed?: true).pluck(:test_id)
  end

  def current_level
    Test.where(level: @test.level).ids - TestPassage.where(user_id: @user.id, passed?: true, test_id: Test.where(level: @test.level)).pluck(:test_id)
  end

  def check_passed_category(badge)
    current_category.empty? && badge.params == @category.title
  end

  def check_number_of_passed_tests(badge)
    @user.passed_tests.uniq.size == eval(badge.params)
  end

  def check_first_try(*args)
    @passed_tests[@test.id] == 1
  end

  def check_passed_level(badge)
    current_level.empty? && badge.params == @test.level
  end

  def add_badge
    Badge.all.map do |badge|
      @user.badges.push(badge) if send(badge.rule, badge)
    end
  end

end
