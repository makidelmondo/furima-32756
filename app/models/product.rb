class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one :deal_record
  has_one_attached :image
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_status_id
    validates :shipping_fee_id
    validates :state_id
    validates :shipping_date_id
  end
  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :product_status_id
    validates :shipping_fee_id
    validates :state_id
    validates :shipping_date_id
    validates :price, numericality: {only_integer: true, greater_than: 299, less_than: 10000000, message: "is invalid. Price must be between 300yen to 9,999,999yen and most be written in harf-width numbers."}
    validates :image
  end
end
