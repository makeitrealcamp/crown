FactoryBot.define do
  factory :incident do
    latitude    { Faker::Number.decimal(l_digits: 5) }
    longitude   { Faker::Number.decimal(l_digits: 5) }
    status      { 2 }
    gender      { 0 }
    age         { 20 }

    association :user,    factory: :user
  end
end
