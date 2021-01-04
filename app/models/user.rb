class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters." }
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." } do
   validates :surname
   validates :name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters." } do
   validates :kana_surname
   validates :kana_name
  end
end