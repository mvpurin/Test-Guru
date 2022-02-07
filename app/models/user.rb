class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy

  def find_test_by_level(level)
    tests_id = test_users.where(user_id: self.id).pluck(:test_id)
    tests.where(id: tests_id, level: level)
  end
end
