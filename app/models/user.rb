class User < ApplicationRecord

  has_and_belongs_to_many :tests, join_table: :tests_users



  
  # def find_test_by_level(level)
  #   tests.where(level: level)
  # end
end
