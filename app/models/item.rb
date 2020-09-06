class Item < ApplicationRecord
  validates :name, :description, precence: true
  varidates :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 }
end
