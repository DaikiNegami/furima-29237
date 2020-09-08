FactoryBot.define do
  factory :item do
    name {"写真"}
    description {"きれい"}
    category_id {1}
    condition_id {1}
    shipping_burden_id {1}
    prefecture_id {1}
    handling_time_id {1}
    price {10000}
    association :user
  end
end
