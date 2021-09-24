FactoryBot.define do
  factory :profile do
    association :user, factory: :user
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    locate { Faker::Address.city }
    birthday { Faker::Date.birthday }
    avatar { nil }
  end
end