FactoryBot.define do
  factory :motorcycle do
    name { Faker::Vehicle.make_and_model }
    img_url { Faker::Avatar.image(slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil) }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    description { Faker::Vehicle.standard_specs }
    model_year { Faker::Vehicle.year }
    engine { Faker::Vehicle.engine }
    fuel_type { Faker::Vehicle.fuel_type }
  end
end
