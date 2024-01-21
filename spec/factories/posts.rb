FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Title_#{n}" }
    sequence(:content) { |n| "Content #{n}" }
    association :author, factory: :user

    trait :published do
      published_at { Time.zone.now }
    end
  end
end
