module UsersHelper

  def completed_tests(user)
    tests = Test.where(id: [user.passed_tests.uniq])
    titles = tests.pluck(:title)
    titles.join("<br>").html_safe
  end

end
