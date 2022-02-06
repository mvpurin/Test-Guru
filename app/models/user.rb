class User < ApplicationRecord
  has_many :tests, through: :test_users, dependent: :destroy
end
