class Test < ApplicationRecord
  belongs_to :category, optional: true
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users, dependent: :destroy
end
