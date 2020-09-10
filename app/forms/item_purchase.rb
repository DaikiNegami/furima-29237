class UserDonation

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input post_code' }
    validates :city, :address
    validates :phone_number, format: { with: /\A\d^(0{1}\d{9,10})$\z/, message: 'is invalid. Input phone number within 11 digits' }

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  
end