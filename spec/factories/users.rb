FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@programmingposts.com" }
    sequence(:first_name) { |n| "FirstName_#{n}" }
    sequence(:last_name) { |n| "LastName_#{n}" }
    password { 'password' }
  end
end
