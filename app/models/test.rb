class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users, through: :test_users, dependent: :destroy
end
