class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling_time
  belongs_to_active_hash :shipping_burden
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :image
    validates :price, numericality: { greater_than: 299, less_than: 10000000 }
  end
  validates :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :handling_time_id, numericality: { other_than: 0 }
  
end
