FactoryBot.define do
  factory :item_purchase do
    token {"sampletoken"}
    post_code {"123-4567"}
    prefecture_id {1}
    city {"横浜市緑区"}
    address {"青山1-1-1"}
    building {}
    phone_number {Faker::Number.number(digits: 11)}
  end
end
