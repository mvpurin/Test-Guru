class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  def self.find_test_by_category(category)
    self.joins("JOIN categories 
      ON tests.category_id = categories.id 
      WHERE categories.title = :category", category: category)
  end
end
