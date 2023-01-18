class Badge < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :user_badges
  has_many :users, through: :user_badges

  mount_uploader :picture, PictureUploader

  scope :beginner, -> {where(title: "Beginner")}
  scope :advanced, -> {where(title: "Advanced")}
  scope :professional, -> {where(title: "Professional")}
  scope :double, -> {where(title: "Double")}

end
