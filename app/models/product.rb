class Product < ApplicationRecord
  belongs_to :user
  has_one :deal_record

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :state_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
end
