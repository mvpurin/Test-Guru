class User < ApplicationRecord
  has_and_belongs_to_many :tests
  
  def find_test_by_level(level)
    tests.where(level: level)
  end
end
