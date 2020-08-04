FactoryBot.define do
  factory :user do
    name { Faker::Games::Pokemon.name }
    points_count { Faker::Number.within(range: 1..10) }
    likes_count { Faker::Number.within(range: 1..10) }
    items_count { Faker::Number.within(range: 1..10) }

    association :team
  end
end
