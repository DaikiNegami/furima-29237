class ItemPurchase

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly' }
    validates :city, :address
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/, message: 'is invalid. Input phone number within 11 digits' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, purchase_id: purchase.id)
  end
  
end