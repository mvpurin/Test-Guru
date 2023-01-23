class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test_passage.test.category
  end

  def add_badge
    Badge.all.map do |badge|
      @user.badges.push(badge) if send(badge.rule, badge)
    end
  end

  private

  def check_passed_category(badge)
    current_category && badge.params == @category.title
  end

  def check_number_of_passed_tests(badge)
    if badge.title == "Beginner" && @user.passed_tests.uniq.size == 1
      return true
    elsif badge.title == "Advanced" && @user.passed_tests.uniq.size == Test.all.size / 2
      return true
    elsif badge.title == "Professional" && @user.passed_tests.uniq.size == Test.all.size
      return true
    end
  end

  def check_first_try(*args)
    TestPassage.where(user_id: @user.id, test_id: @test.id, passed: true).pluck(:test_id).size == 1
  end

  def check_passed_level(badge)
    current_level && badge.params == @test.level
  end

  def current_category
    arr1 = @category.tests.ids
    arr2 = TestPassage.where(user_id: @user.id, test_id: @category.tests.ids, passed: true).pluck(:test_id)
    arr1 == arr2
  end

  def current_level
    arr1 = Test.where(level: @test.level).ids
    arr2 = find_tests_by_level
    arr1 == arr2
  end

  def find_tests_by_level
    Test.joins('INNER JOIN test_passages ON tests.id = test_passages.test_id').where('tests.level = :level AND
      test_passages.passed = true AND test_passages.user_id = :user_id', level: @test.level, user_id: @user.id)
  end

end
