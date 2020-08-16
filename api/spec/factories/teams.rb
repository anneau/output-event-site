FactoryBot.define do
  factory :team do
    name { 'TeamA' }
    points_count { Faker::Number.within(range: 1..10) }
    likes_count { Faker::Number.within(range: 1..10) }
    items_count { Faker::Number.within(range: 1..10) }
  end
end
