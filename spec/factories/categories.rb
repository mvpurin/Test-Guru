FactoryBot.define do
  factory :category do
    title { 'CategoryTitle' }

    trait :invalid do
      title { nil }
    end
  end
end