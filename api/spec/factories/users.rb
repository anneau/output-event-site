FactoryBot.define do
  factory :user do
    name { '@testuser' }
    qiitas_id { 1 }
    points_count { 1 }
    likes_count { 1 }
    items_count { 1 }

    association :team
  end
end
