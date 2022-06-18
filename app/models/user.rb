class User < ApplicationRecord
  require 'uri'

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def find_test_by_level(level)
    Test.joins('JOIN test_users ON tests.id = test_users.test_id').where('test_users.user_id = :id AND tests.level = :level', id: self.id, level: level).pluck(:title)
  end

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
