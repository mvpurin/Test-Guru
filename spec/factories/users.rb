FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end
  sequence :first_name do |n|
    "user#{n}_first_name"
  end
  sequence :last_name do |n|
    "user#{n}_last_name"
  end

  factory :user do
    email
    first_name
    last_name
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end