FactoryBot.define do
  factory :test do
    title { 'TestTitle' }

    trait :invalid do
      title { nil }
    end
  end
end