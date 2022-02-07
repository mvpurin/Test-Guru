class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy
end
