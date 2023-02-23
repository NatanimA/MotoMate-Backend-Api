FactoryBot.define do
  factory :reservation do
    city { Faker::Address.city }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { Faker::Date.between(from: Date.today, to: 2.days.from_now) }
    user { create(:user).id }
    motorcycle { create(:motorcycle) }
  end
end
