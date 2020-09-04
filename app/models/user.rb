class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
      validates :nickname
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Input half-width characters."
      NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
        validates_format_of :first_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters.' 
        validates_format_of :last_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters.'
      KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
        validates_format_of :first_name_kana, with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters.' 
        validates_format_of :last_name_kana, with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters.'
      validates :birth_date
  end
end
