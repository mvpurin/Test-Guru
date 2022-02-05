class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_and_belongs_to_many :users, join_table: :tests_users



  # def self.find_test_by_category(category)
  #   self.joins("JOIN categories 
  #     ON tests.category_id = categories.id 
  #     WHERE categories.title = :category", category: category)
  # end
end
