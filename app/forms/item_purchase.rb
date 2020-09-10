class UserDonation

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input post_code' }
    validates :city, :address, :token
    validates :phone_number, format: { with: /\A\d^(0{1}\d{9,10})$\z/, message: 'is invalid. Input phone number within 11 digits' }

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    Address.create(post_code: post_code, prefecture_id: prefecture.id,city: city, address: address, phone_number: phone_number,purchase_id: purchase.id)
    Purchase.create(user_id: user.id, item_id: item.id)
  end
  
end