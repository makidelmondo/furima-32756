require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品' do
    context "出品が出品できる場合" do
      it "全記入欄に記入があれば出品できる" do
        expect(@product).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "商品名が空と出品できない" do
        @product.title = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it "商品説明が空と出品できない" do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが空と出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it "状態が空と出品できない" do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 1")
      end
      it "送料が空と出品できない" do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it "発送元が空と出品できない" do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("State must be other than 1")
      end
      it "発送日数が空と出品できない" do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "価格が空と出品できない" do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が全角数字だと出品できない" do
        @product.price = '２０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Price most be between 300yen to 9,999,999yen and most be written in harf-width numbers.")
      end
      it "半角英数混合だと出品できない" do
        @product.price = 'A2000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Price most be between 300yen to 9,999,999yen and most be written in harf-width numbers.")
      end
      it "半角英字だけだと出品できない" do
        @product.price = 'techcamp'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Price most be between 300yen to 9,999,999yen and most be written in harf-width numbers.")
      end
      it "価格が300円未満だと出品できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Price most be between 300yen to 9,999,999yen and most be written in harf-width numbers.")
      end
      it "価格が9999999円以上だと出品できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Price most be between 300yen to 9,999,999yen and most be written in harf-width numbers.")
      end
      it "画像が空だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end