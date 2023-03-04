FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "#{Faker::Name.name[3, 20]}#{n}" }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
