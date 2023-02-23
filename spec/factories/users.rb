FactoryBot.define do
  factory :user do
    name { Faker::Name.name[0, 20] }
    user_name { Faker::Internet.username }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
