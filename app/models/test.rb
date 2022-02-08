class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users, dependent: :destroy

  def self.find_test_by_category(category)
    Test.joins('JOIN categories on tests.category_id = categories.id').where('categories.title = :category', category: category).order('tests.title DESC')
  end
end
