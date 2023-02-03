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

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.type == "Admin"
  end

  def passed_tests
    TestPassage.where(passed: true, user_id: self.id).pluck(:test_id)
  end

end
