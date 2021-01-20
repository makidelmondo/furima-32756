class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :deal_records

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Input the both of half-width characters and half-width numbers."

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters." }
    validates :birthday
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." } do
      validates :surname
      validates :name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width Katakana characters." } do
      validates :kana_surname
      validates :kana_name
    end
  end
end