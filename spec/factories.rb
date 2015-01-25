FactoryGirl.define do
  factory :category do
    name        { Faker::Lorem.words(2) }
    title       { Faker::Lorem.words(3) }
    description { Faker::Lorem.words(6) }
  end
end
