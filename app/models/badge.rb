class Badge < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :test_passages
  has_many :users, through: :test_passages

  scope :beginner, -> {}
  # scope :easy, -> {where(level: 0..1)}

end
