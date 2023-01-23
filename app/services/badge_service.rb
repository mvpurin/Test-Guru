class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def add_badge
    Badge.all.map do |badge|
      @user.badges.push(badge) if send(badge.rule, badge.params)
    end
  end

  private

  def check_passed_category(params)
    @category = @test_passage.test.category
    return if params != @category.title
    current_category && params == @category.title
  end

  def check_number_of_passed_tests(params)
    if params == "beginner" && @user.passed_tests.uniq.size == 1
      return true
    elsif params == "advanced" && @user.passed_tests.uniq.size == Test.all.size / 2
      return true
    elsif params == "professional" && @user.passed_tests.uniq.size == Test.all.size
      return true
    end
  end

  def check_first_try(*args)
    test_passage = TestPassage.where(user_id: @user.id, test_id: @test.id)
    test_passage.pluck(:test_id).size == 1 && test_passage.last.passed == true
  end

  def check_passed_level(params)
    return if params.to_i != @test.level
    current_level && params.to_i == @test.level
  end

  def current_category
    @category = @test_passage.test.category
    all_tests_from_category = @category.tests.ids
    passed_tests_from_category = TestPassage.where(user_id: @user.id, test_id: all_tests_from_category, passed: true).pluck(:test_id).uniq
    all_tests_from_category == passed_tests_from_category
  end

  def current_level
    all_tests_from_level = Test.where(level: @test.level).ids
    passed_tests_from_level = find_tests_by_level
    all_tests_from_level == passed_tests_from_level
  end

  def find_tests_by_level
    Test.joins('INNER JOIN test_passages ON tests.id = test_passages.test_id').where('tests.level = :level AND
      test_passages.passed = true AND test_passages.user_id = :user_id', level: @test.level, user_id: @user.id).pluck(:id)
  end

end
