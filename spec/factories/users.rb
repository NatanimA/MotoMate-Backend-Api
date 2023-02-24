FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "#{Faker::Name.name[3, 20]}#{n}" }
    user_name { Faker::Internet.username }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
