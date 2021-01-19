require 'rails_helper'

RSpec.describe DealShipment, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    product = FactoryBot.create(:product, user_id: seller.id)
    sleep 0.2
    product.save
    @deal_shipment = FactoryBot.build(:deal_shipment, user_id: buyer.id, product_id: product.id)
  end

  describe '購入' do
    context "商品が購入できる場合" do
      it "全記入欄に記入があれば出品できる" do
        expect(@deal_shipment).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it "郵便番号が空だと出品できない" do
        @deal_shipment.zip_code = nil
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Input with - and half-width numbers.")
    end
      it "郵便番号に-が無いと出品できない" do
        @deal_shipment.zip_code = "1940041"
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Zip code is invalid. Input with - and half-width numbers.")
    end
      it "都道府県が空だと出品できない" do
        @deal_shipment.state_id = 1
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("State must be other than 1")
    end
      it "市区町村が空だと出品できない" do
        @deal_shipment.city = nil
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("City can't be blank")
    end
      it "番地が空だと出品できない" do
        @deal_shipment.street = nil
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Street can't be blank")
    end
      it "電話番号が空だと出品できない" do
        @deal_shipment.telephone = nil
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Telephone can't be blank")
      end
      it "電話番号にハイフンがあると出品できない" do
        @deal_shipment.telephone = "090-1919-0721"
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Telephone is invalid. Input half-width numbers without -.")
      end
      it "電話番号にハイフンがあると出品できない" do
        @deal_shipment.telephone = "191907210721"
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Telephone is invalid. Input half-width numbers without -.")
      end
      it "tokenが空だと出品できない" do
        @deal_shipment.token = nil
        @deal_shipment.valid?
        expect(@deal_shipment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


