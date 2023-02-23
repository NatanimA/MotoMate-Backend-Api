FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    user_name { Faker::Internet.username }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
