class DealShipment
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :state_id, :city, :street, :apartment, :telephone

  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input with - and half-width numbers." }
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width numbers without -." }
    validates :city
    validates :street
    validates :state_id, numericality: { other_than: 1 } 
  end

  def save
    deal_record = DealRecord.create(user_id: user_id, product_id: product_id)
    Shipment.create(zip_code: zip_code, state_id: state_id, city: city, street: street, apartment: apartment, telephone: telephone, deal_record_id: deal_record.id)
  end
end