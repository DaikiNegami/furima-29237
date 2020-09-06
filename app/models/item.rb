class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling_time
  belongs_to_active_hash :shipping_burden
  validates :name, :description, :price, precence: true
  varidates :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 }
end
