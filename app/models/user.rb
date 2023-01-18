class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  require 'uri'

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :created_badges, class_name: 'Badge', foreign_key: 'author_id', dependent: :destroy

  def find_test_by_level(level)
    Test.joins('JOIN test_users ON tests.id = test_users.test_id').where('test_users.user_id = :id AND tests.level = :level', id: self.id, level: level).pluck(:title)
  end

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.type == "Admin"
  end

  def passed_tests
    @arr = TestPassage.all.map {|test_passage| test_passage.test_id if test_passage.user_id == self.id && test_passage.pass_the_test?}
    @arr = @arr.compact
  end

  def passed_tests_counter(passed_tests)
    hash = Test.all.each_with_object(Hash.new 0) {|test, hash| hash[test.id] = 0}
    hash2 = passed_tests.each_with_object(Hash.new 0) {|passed_test, counter| counter[passed_test] += 1}
    hash.merge(hash2)
  end

end
