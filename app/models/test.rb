class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users

  scope :find_test_by_category, -> (category) {
    joins(:category)
    .where(categories: {title: category})
    .order('tests.title DESC')
    .pluck(:title)
  }

  scope :easy, -> {where(level: 0..1)}
  scope :normal, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
